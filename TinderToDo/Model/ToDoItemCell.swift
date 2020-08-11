//
//  ToDoItemCell.swift
//  TinderToDo
//
//  Created by Narumi Nogawa on 2020/05/08.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
