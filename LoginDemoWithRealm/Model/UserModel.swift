//
//  UserModel.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 30/11/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: NSObject {
    
    var realm: Realm = try! Realm()
    var password: String
    var name: String
    var x_acc: String
    
    init(name: String, password: String, x_acc: String) {
        self.name = name
        self.password = password
        self.x_acc = x_acc
    }
    
    override init() {
        self.name = ""
        self.password = ""
        self.x_acc = ""
    }
    
    func save()  {
        let userModelReal: UserModelRealm = UserModelRealm()
        userModelReal.userName = self.name;
        userModelReal.password = self.password;
        userModelReal.xacc = self.x_acc;
        
        try! self.realm.write {
            self.realm.add(userModelReal, update: true)
            print("Added new object")
        }
    }
    
    func isLogedin() -> Bool {
        if let users = self.realm.objects(UserModelRealm.self).first {
            print(users.userName)
            print(users.password)
            print(users.xacc)
            return true
        }
        return false
    }
    
    func Logout() {
        if let users = self.realm.objects(UserModelRealm.self).first {
            /*print(users.userName)
             print(users.password)
             print(users.xacc)*/
            try! self.realm.write {
                self.realm.delete(users)
                print("user logout success fully")
            }
        }
    }
}
