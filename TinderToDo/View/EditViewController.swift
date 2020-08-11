//
//  EditViewController.swift
//  TinderToDo
//
//  Created by Narumi Nogawa on 2020/05/08.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var memoTextView: UITextView!
    
    let realm = try! Realm()
    var toDoCells: Results<ToDoModel>!
    var cellID: Int = -1    // NOTE: マイナスの場合は新しいセルを表す
    var cell: ToDoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            toDoCells = realm.objects(ToDoModel.self)
        }
        if cellID >= 0 {
            // 編集モード
            cell = toDoCells[cellID]
        } else {
            // 新規要素追加モード
            cell = ToDoModel()
            cell.id = toDoCells.count
        }
        self.titleTextField.text = cell.title
        self.memoTextView.text = cell.memo
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.post(name: .disappeareEditVC, object: nil)
    }

    @IBAction private func saveButtonTapped(_ sender: Any) {
        do{
            try realm.write({ () -> Void in
                cell.title = self.titleTextField.text ?? "Title"
                cell.memo = self.memoTextView.text
                if cellID >= 0 {
                    realm.add(cell, update: .modified)
                } else {
                    realm.add(cell)
                }
            })
        }catch{
            print("Save was Failed")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func deleteButtonTapped(_ sender: Any) {
        do{
            try realm.write {
                if cellID >= 0 {
                    realm.delete(cell)
                }
            }
        }catch{
            print("Delete was Failed...")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.memoTextView.isFirstResponder) {
            self.memoTextView.resignFirstResponder()
        }
        if (self.titleTextField.isFirstResponder) {
            self.titleTextField.resignFirstResponder()
        }
    }

}
