//
//  HomeVC.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 03/12/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var tvMain: UITableView!
    @IBOutlet weak var lblUserName: UILabel!

    var userModel = UserModel()

    var itemListViewModel: ItemListViewModel = ItemListViewModel()
    var isPageing:Bool  = true
    var refreshControl = UIRefreshControl()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblUserName.text = userModel.name
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)

        self.tvMain.addSubview(refreshControl) // not required when using UITableViewController

        self.itemListViewModel.itemListVCResponseDelegate = self
        self.setUpTv()
        self.itemListViewModel.getItemList(vc: self)
    }

    @objc func refresh() {
        // Code to refresh table view
        self.tvMain.reloadData()
        self.refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- ~~~~~~~~~~~~~~~ Other Methods
    
    func setUpTv()
    {
        self.tvMain.delegate        = self
        self.tvMain.dataSource      = self
        self.tvMain.estimatedRowHeight  = 50
        self.tvMain.rowHeight           = UITableViewAutomaticDimension
        self.tvMain.register(UINib(nibName: "HomeVCCell", bundle: nil), forCellReuseIdentifier: "HomeVCCell")
    }
    //MARK:- ~~~~~~~~~~~~~~~ logout Action

    @IBAction func btnLogOutClicked(_ sender: Any){
        let userModel = UserModel()
        userModel.Logout()
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- ~~~~~~~~~~~~~~~ UITableView Delegate

extension HomeVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.itemListViewModel.itemListModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeVCCell", for: indexPath) as! HomeVCCell
        
        cell.lblProductName.text = "Name : " + self.itemListViewModel.itemListModel.products[indexPath.row].productName
        cell.lblProductPrice.text = "Price : $" + self.itemListViewModel.itemListModel.products[indexPath.row].productPrice
        let imagePath = self.itemListViewModel.itemListModel.products[indexPath.row].imageUrl

        cell.imgProduct.sd_setShowActivityIndicatorView(true)
        cell.imgProduct.sd_setIndicatorStyle(.gray)
        cell.imgProduct.sd_setImage(with: URL(string: imagePath), placeholderImage: nil, options: [.continueInBackground,.lowPriority], completed: {(image,error,cacheType,url) in
        })

        if indexPath.row == self.itemListViewModel.itemListModel.products.count - 1
        {
            //if self.strTotalCount > indexPath.row
            if self.isPageing
            {
                self.itemListViewModel.getItemList(vc: self)
            }
        }
        
        return cell
    }
}


extension HomeVC: ItemListVCResponseDelegate {
    
    func didFinishProcessSuccessFully() {
        self.tvMain.reloadData()
    }
    
    func didFailToGetReponse() {
        
    }
}

