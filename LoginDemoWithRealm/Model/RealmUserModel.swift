//
//  RealmUserModel.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 03/12/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: Model

class UserModelRealm: Object {
    @objc dynamic var userName = ""
    @objc dynamic var password = ""
    @objc dynamic var xacc = ""
    @objc dynamic var id = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
