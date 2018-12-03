//
//  ItemListViewModel.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 03/12/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

protocol ItemListVCResponseDelegate: class {
    func didFinishProcessSuccessFully()
    func didFailToGetReponse()
}
protocol ItemListViewModelProtocol {
    var status: Dynamic<String> { get }
    var errorMessage: Dynamic<String> { get }
    var products: Dynamic<[product]> { get }
}
class ItemListViewModel: ItemListViewModelProtocol {
    
    var products: Dynamic<[product]>    = Dynamic([product]())
    var status: Dynamic<String>         = Dynamic("")
    var errorMessage: Dynamic<String>   = Dynamic("")
        
    var itemListModel:ItemListModel
    
    weak var itemListVCResponseDelegate: ItemListVCResponseDelegate?

    init() {
        self.itemListModel = ItemListModel()
    }
    
    func isUsernameValid() -> Bool {
        return true
    }
    
    func isPasswordValid() -> Bool {
        return true
    }
    
    func getItemList(vc:UIViewController) {
        
        let parameters:[String : AnyObject] =  [:]
        
        makeRequest(view: vc.view, WithURL: API.GetItemList, method: .get, parameter: parameters as [String : AnyObject], completion: { (response, error) in
            let json = JSON(response?.result.value! as Any)

            let list = json["products"].arrayValue
            
            for item in list
            {
                self.itemListModel.products.append(product(productId: item["productId"].stringValue, productName: item["productName"].stringValue, imageUrl: item["imageUrl"].stringValue, productPrice: item["price"].stringValue))
            }
            self.itemListVCResponseDelegate?.didFinishProcessSuccessFully()
        }, satusFailCompletion: {
            self.itemListVCResponseDelegate?.didFailToGetReponse()
        })
    }
}
