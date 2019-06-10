//
//  EditTuc.swift
//  TPIOS1
//
//  Created by epita on 10/06/2019.
//  Copyright © 2019 epita. All rights reserved.
//
import UIKit

class EditTuc {
    var index: IndexPath
    var item: ToDoItem
    
    init (index:IndexPath,item:ToDoItem) {
        self.index = index
        self.item = item
    }
}
