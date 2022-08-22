//
//  DBModel.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/08/22.
//

import Foundation
import RealmSwift

class UserShoppingList: Object {
    @Persisted var item: String = ""
    @Persisted var favorite: Bool?
    @Persisted var check: Bool?

    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(item:String) {
        self.init()
        self.item = item
        self.favorite = false
        self.check = false
    }
}

