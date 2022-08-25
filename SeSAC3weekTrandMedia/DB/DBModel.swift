//
//  DBModel.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/08/22.
//

import Foundation
import RealmSwift
import UIKit

class UserShoppingList: Object {
    
    @Persisted var item: String = ""
    @Persisted var favorite: Bool
    @Persisted var check: Bool
    @Persisted var itemImage: String = ""

    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(item: String, favorite: Bool, check: Bool, itemImage: String) {
        self.init()
        self.item = item
        self.favorite = favorite
        self.check = check
        self.itemImage = itemImage
    }
}

