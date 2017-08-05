//
//  DashboardViewController.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/8/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit

class EmpolyessDetails: UIViewController {

    @IBOutlet weak var btnManagerInfo: UIButton!
    @IBOutlet weak var lblNoRecordFound: UILabel!
    @IBOutlet weak var viewBGDetails: UIView!
    @IBOutlet weak var tblDashbord: UITableView!
    @IBOutlet weak var btnAddRecord: UIButton!
    var arrEmpRecord = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.btnManagerInfo.setTitle(Helper.sharedClient.loginEmail!, forState: .Normal)
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        arrEmpRecord.removeAll()
        //arrEmpRecord = DBHelper.JAFetchAllEmployeeWith(forManagerEmail: Helper.sharedClient.loginEmail!) as [AnyObject]
        let arrmanger =  DBHelper.JAFetchManagerRecordWith(forManagerEmail: Helper.sharedClient.loginEmail!) as [AnyObject]
      
        if arrmanger.count > 0{
            let objResult = arrmanger[0] as! Manager
            let rObject =  objResult.rManager
            print("arrrecord\(arrEmpRecord)")
            
            for objtEmploy in rObject!{
                arrEmpRecord.append(objtEmploy)
                
            }
            
            if arrEmpRecord.count > 0{
                self.tblDashbord.hidden  = false
                self.tblDashbord.reloadData()
            }else{
                self.tblDashbord.hidden = true
            }
        }
        else{
             self.tblDashbord.hidden = true
        }
       
   
    
    }
    

    @IBAction func actionManagerInfo(sender: UIButton) {
        let managerInfoVC = self.storyboard?.instantiateViewControllerWithIdentifier(String(ManagerInfoViewController)) as! ManagerInfoViewController
        managerInfoVC.total = self.arrEmpRecord.count
        self.navigationController?.pushViewController(managerInfoVC, animated: true)
    }
    @IBAction func actionBack(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
  
    @IBAction func actionAddRecord(sender: UIButton) {
    let addEmpVC = self.storyboard?.instantiateViewControllerWithIdentifier(String(AddEmployeeViewController)) as! AddEmployeeViewController
        self.navigationController?.pushViewController(addEmpVC, animated: true)
    }
    // MARK:- Table View Delete
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return arrEmpRecord.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
 
        let cell = tableView.dequeueReusableCellWithIdentifier(String(EmpolyessDetailsCell), forIndexPath: indexPath) as! EmpolyessDetailsCell
        let objData = arrEmpRecord[indexPath.row] as! Employees
        
    
    
        cell.lblName.text = objData.empName
        cell.lblAddress.text  = objData.empAddress
        cell.lblPhoneNumber.text = objData.phoneNumber


        return cell
    }
}
