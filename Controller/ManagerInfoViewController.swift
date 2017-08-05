//
//  ManagerInfoViewController.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/11/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit

class ManagerInfoViewController: BaseViewController {

    @IBOutlet weak var viewBGBox: UIView!
    @IBOutlet weak var lblEmail: UILabel!
    var total: Int?
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPhoneNo: UILabel!
    
    @IBOutlet weak var lblTotalCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewBGBox.layer.cornerRadius = 8.0
        let arrResult = DBHelper.JAFetchManagerRecordWith(forManagerEmail: Helper.sharedClient.loginEmail!)
        if arrResult.count > 0{
            let objectManager = arrResult[0] as! Manager
            self.lblEmail.text = objectManager.mangEmail
            self.lblAddress.text = objectManager.mangAddress
            self.lblPhoneNo.text = objectManager.mangPhone
            self.lblTotalCount.text = " Total Employee: \(total!)"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func actionBack(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
   
    @IBAction func actionDeleteRecord(sender: UIButton) {
    
    
    let result = DBHelper.deleteManagerRecordWith(forManagerEmail: Helper.sharedClient.loginEmail!)
        if result ==  true{
          self.navigationController?.popViewControllerAnimated(true)
            
        }else{
            self.showMessage("Alert", bodyMessage: "Some Error!")
        }
        
    }

}
