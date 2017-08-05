//
//  LoginViewViewController.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/10/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit

class LoginViewViewController: BaseViewController {

    @IBOutlet weak var viewBGBox: UIView!
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var textUserName: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewBGBox.layer.cornerRadius = 8.0
        self.textUserName.text = "jitu@gmail.com"
        self.textPassword.text = "123"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    @IBAction func actionLogin(sender: UIButton) {
   
        if !(self.ValidateFields())
        {
            print(" some thing is missing")
            return;
        }
    let result = DBHelper.JAauthenticateManager(textUserName.text, password: "123")
        
        if result.count > 0 {
            let objManager = result[0] as! Manager
            print("rsule]\(objManager.mangEmail)")
            Helper.sharedClient.loginEmail = objManager.mangEmail
            let empDetailsVC = self.storyboard?.instantiateViewControllerWithIdentifier(String(EmpolyessDetails)) as! EmpolyessDetails
            
            self.navigationController?.pushViewController(empDetailsVC, animated: true)
        }
        else{
            self.showMessage("", bodyMessage: "Worng Login")
        }

        
    }

    @IBAction func actionRegister(sender: UIButton) {
    let empVC = self.storyboard?.instantiateViewControllerWithIdentifier(String(AddEmployeeViewController)) as! AddEmployeeViewController
        empVC.eAddEmpyMangerStatus = .eAddmanager
        self.navigationController?.pushViewController(empVC, animated: true)
    }
    
    // mark-  ValidateFields
    func ValidateFields() -> Bool
    {
        self.view.endEditing(true)
        let result = true
        if(self .trim(textUserName.text!).length == 0){
            
            self.showMessage("", bodyMessage: "Enter name")
            return false
        }
        else if(self .trim(textPassword.text!).length == 0){
            
            
            self.showMessage("", bodyMessage: "Enter Address")
            return false
        }
       
        
        if !(BaseViewController.isValidEmail(self.trim(textUserName.text!) as String)){
            self.showMessage("", bodyMessage: "Please enter Correct Email")
        }
        
        
        return result
    }

    
}
