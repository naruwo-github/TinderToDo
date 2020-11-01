//
//  ViewController.swift
//  TinderToDo
//
//  Created by Narumi Nogawa on 2020/05/07.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit

import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var newToDoButton: UIButton!
    @IBOutlet private weak var nextPageButton: UIButton!
    @IBOutlet private weak var otherButton: UIButton!
    
    let realm = try! Realm()
    var toDoCells: Results<ToDoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            toDoCells = realm.objects(ToDoModel.self)
        }
        
        self.tableView.register(UINib(nibName: "ToDoItemCell", bundle: nil), forCellReuseIdentifier: "ToDoItemCell")
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: .disappeareEditVC, object: nil)
        self.refresh()
    }
    
    @IBAction private func newToDoButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
        .instantiateViewController(withIdentifier: "EditViewController")
        as! EditViewController
        present(vc, animated: true)
    }
    
    @IBAction private func nextPageButtonTapped(_ sender: Any) {
    }
    
    @IBAction private func otherButtonTapped(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.toDoCells[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            } catch {
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath ) as! ToDoItemCell
        let object = toDoCells[indexPath.row]
        cell.titleLabel.text = object.title
        cell.memoLabel.text = object.memo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = toDoCells[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
        .instantiateViewController(withIdentifier: "EditViewController")
        as! EditViewController
        vc.cellID = object.id
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoCells.count
    }

    @objc func refresh() {
        self.tableView.reloadData()
    }
    
}

extension Notification.Name {
    static let disappeareEditVC = Notification.Name("disappeareEditVC")
}
