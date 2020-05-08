//
//  ToDoModel.swift
//  TinderToDo
//
//  Created by Narumi Nogawa on 2020/05/08.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoModel: Object {
    @objc dynamic var id = 0
    @objc dynamic var title: String = "Title"
    @objc dynamic var memo: String = "Memo: "
    @objc dynamic var highlight: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
