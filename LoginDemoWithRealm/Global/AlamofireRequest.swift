//
//  AlamofireRequest.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 02/12/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//import Toast_Swift

func makeRequest(view : UIView,WithURL url : String , method : HTTPMethod,parameter  : [String : AnyObject],completion:@escaping(DataResponse<Any>?,Error?)->(),satusFailCompletion : @escaping ()->())
{
    AppDelegate.shared().ShowSpinnerView()
    Alamofire.request(URL.init(string: url)!, method: method, parameters: parameter, encoding: URLEncoding.default, headers: nil).validate()
        .responseJSON { response in
            if response.result.value != nil
            {
                
                if(response.response?.statusCode == 200) // check status
                {
                    AppDelegate.shared().HideSpinnerView()
                    completion(response,nil)
                }
                else{
                    AppDelegate.shared().HideSpinnerView()
                    satusFailCompletion()
                }
            }
            else
            {
                //Utility.showMsg(strMSg: Utility.showError(error: response.error! as NSError))
                AppDelegate.shared().showSimpleAlert("Error", message: "\(response.error!)")
            }
            
    }
}

