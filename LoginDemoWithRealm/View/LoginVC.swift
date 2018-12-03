//
//  LoginVC.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 30/11/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginVC: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUserName :BindingTextField?
    @IBOutlet weak var txtPassword :BindingTextField?
    
    var loginModel: LoginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserName?.bind { self.loginModel.username.value = $0 }
        txtPassword?.bind { self.loginModel.password.value = $0 }
        loginModel.loginVCResponseDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func loginButton(_ sender: Any) {
        print("\(loginModel.username.value)")
        print("\(loginModel.password.value)")
        self.loginModel.loginWithDetail(vc: self)
    }


}

extension LoginVC: LoginVCResponseDelegate {
    func didFinishProcessSuccessFully() {
        
        self.txtPassword?.text = ""
        self.txtUserName?.text = ""
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        
        self.navigationController?.pushViewController(VC, animated: true)

    }
    
    func didFailToGetReponse() {
        
    }
}


