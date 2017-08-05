//
//  AddEmployeeTableViewController.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/10/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit
enum eEmplyddd {
    case eAddEmploy
    case eAddmanager
}
class AddEmployeeViewController: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var nsConstHightNumber: NSLayoutConstraint!
    @IBOutlet weak var viewBGBox: UIView!
    @IBOutlet weak var btnDone: UIButton!
    var loginEmail: String?
    var eAddEmpyMangerStatus:eEmplyddd = .eAddEmploy
    @IBOutlet weak var textEmpName: UITextField!
    
    @IBOutlet weak var textEmpAddress: UITextField!
    
    @IBOutlet weak var textEmpPhone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if eAddEmpyMangerStatus == .eAddEmploy{
          self.lblTitle.text = "Add Employee"
        }else if eAddEmpyMangerStatus == .eAddmanager{
           self.lblTitle.text = "Add Manager"
            
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func actionBack(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func actionDone(sender: UIButton) {
        if !(self.ValidateFields())
        {
            print(" some thing is missing")
            return;
        }
        if eAddEmpyMangerStatus == .eAddmanager {
            let result =  DBHelper.JAsaveManagerRecord(forManagerName: self.textEmpName.text, managerPhoneNumber: self.textEmpPhone.text, password: "123", managerAddress: self.textEmpAddress.text)
            if result == true{
                self.showMessage("", bodyMessage: "Record Save")
                
            }else{
                self.showMessage("Alert", bodyMessage: "Some Erroe!")
            }
        }
        else if eAddEmpyMangerStatus == .eAddEmploy{
          let result = DBHelper.JAsaveEmployeeRecord(forManagerName: Helper.sharedClient.loginEmail!, employEmail: textEmpName.text, phoneNumber: textEmpPhone.text, address: textEmpAddress.text)
            if result == true{
                self.showMessage("", bodyMessage: "Record Save")
                
            }else{
                self.showMessage("Alert", bodyMessage: "Some Erroe!")
            }
        }
   
        
    
    }
    // mark-  ValidateFields
    func ValidateFields() -> Bool
    {
        self.view.endEditing(true)
        let result = true
         if(self .trim(textEmpName.text!).length == 0){

            self.showMessage("", bodyMessage: "Enter name")
            return false
        }
        else if(self .trim(textEmpAddress.text!).length == 0){
   
            
            self.showMessage("", bodyMessage: "Enter Address")
            return false
        }
         else if(self .trim(textEmpPhone.text!).length == 0){
            self.showMessage("", bodyMessage: "Enter Address")
            return false
        }

        if !(BaseViewController.isValidEmail(self.trim(textEmpName.text!) as String)){
         self.showMessage("", bodyMessage: "Please enter Correct Email")
        }
       
        
        return result
    }

}
