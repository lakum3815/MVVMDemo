//
//  LoginViewModel.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 02/12/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import RealmSwift

protocol LoginVCResponseDelegate: class {
    func didFinishProcessSuccessFully()
    func didFailToGetReponse()
}
protocol LoginViewModelProtocol {
    var username: Dynamic<String> { get }
    var password: Dynamic<String> { get }
    var xacc: Dynamic<String> { get }
}
class LoginViewModel: LoginViewModelProtocol {
    
    var username: Dynamic<String>   = Dynamic("")
    var password: Dynamic<String>   = Dynamic("")
    var xacc: Dynamic<String>       = Dynamic("")
    var userModel = UserModel()
    
    weak var loginVCResponseDelegate: LoginVCResponseDelegate?
    
    init() {
        self.userModel = UserModel(name: self.username.value, password: self.password.value, x_acc: self.xacc.value)
    }
    
    func isUsernameValid() -> Bool {
        return true
    }
    
    func isPasswordValid() -> Bool {
        return true
    }
    
    func loginWithDetail(vc:UIViewController) {
        
        let parameters =  [ APIsRequestParams.LoginPara.username : self.username.value,
                            APIsRequestParams.LoginPara.password : self.password.value
        ]
        
        makeRequest(view: vc.view, WithURL: API.LoginUser, method: .post, parameter: parameters as [String : AnyObject], completion: { (response, error) in
            
            if let allHeaders = response?.response?.allHeaderFields {
                if let xacc = allHeaders["X-Acc"] as? String {
                    self.xacc.value = xacc
                    self.userModel = UserModel(name: self.username.value, password: self.password.value, x_acc: self.xacc.value)
                    self.userModel.save()
                }
            }
            self.loginVCResponseDelegate?.didFinishProcessSuccessFully()
        }, satusFailCompletion: {
            self.loginVCResponseDelegate?.didFailToGetReponse()
        })
    }
}
