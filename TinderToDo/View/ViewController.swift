//
//  ViewController.swift
//  TinderToDo
//
//  Created by Narumi Nogawa on 2020/05/07.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    var toDoCells: Results<ToDoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            toDoCells = realm.objects(ToDoModel.self)
        }
    }


}

