//
//  ItemListModel.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 03/12/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
class product{
    var productId:String
    var productPrice:String
    var productName:String
    var imageUrl:String
    
    init() {
        self.productId      = ""
        self.productPrice   = ""
        self.productName    = ""
        self.imageUrl       = ""
    }
    
    init(productId: String, productName: String, imageUrl: String, productPrice: String) {
        self.productId = productId
        self.productPrice = productPrice
        self.productName = productName
        self.imageUrl = imageUrl
    }

}
class ItemListModel: NSObject {
    
    var status: String
    var errorMessage: String
    var products:[product]
    
    init(status: String, errorMessage: String, products: [product]) {
        self.status = status
        self.errorMessage = errorMessage
        self.products = products
    }
    override init() {
        self.status = ""
        self.errorMessage = ""
        self.products = [product]()
    }
}
