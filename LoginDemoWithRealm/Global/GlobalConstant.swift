//
//  GlobalConstant.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 02/12/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation

// MARK: - API LIST
/**
 * MARK: API
 * APIs of the app
 */

struct API
{
    /**
     *Base Url
     */
    static var baseUrl:String = "http://private-222d3-homework5.apiary-mock.com/api/"
    
    //Login Url
    static var LoginUser:String = baseUrl+"login"
    
    //GetItemList Url
    static var GetItemList:String = baseUrl+"product/list"

}

/**
 * API Request paramter
 */
struct APIsRequestParams
{
    
    /**
     * MARK: LoginPara
     * keys of LoginUser api parameters
     * ApplicationType: for username
     */
    struct LoginPara  
    {
        static let username  = "username"
        static let password  = "password"
    }
    
}

