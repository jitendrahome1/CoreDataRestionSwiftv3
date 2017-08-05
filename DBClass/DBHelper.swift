//
//  DBHelper.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/10/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit
import CoreData
class DBHelper: NSObject {

    class func JAsaveManagerRecord(forManagerName managerEmail:NSString!, managerPhoneNumber:NSString!, password:NSString!, managerAddress: String!)->Bool
    {
        var result: Bool = false
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext   =  appDel.managedObjectContext
        let managerDetails : Manager?      =  NSEntityDescription.insertNewObjectForEntityForName("Manager", inManagedObjectContext:managedContext) as? Manager

        
        if let objUser = managerDetails
        {
            objUser.mangEmail = managerEmail as String
            objUser.mangPassword = password as String
            objUser.mangPhone = managerPhoneNumber as String
            objUser.mangAddress = managerAddress as String
            do {
                try objUser.managedObjectContext?.save()
              result = true
            } catch {
                result =  false
                let saveError = error as NSError
                print(saveError)
            }
            
        }
        return result
    }
    // Login
    class func JAauthenticateManager(email:NSString! , password:NSString!)->NSArray!
    {
        var result = [];
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext   =  appDel.managedObjectContext
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Manager", inManagedObjectContext:managedContext)
        fetchRequest.entity = entityDescription
        let predicate = NSPredicate(format: "mangEmail == %@ AND mangPassword == %@", email! , password!)
        fetchRequest.predicate = predicate
        do
        {
            try result = managedContext.executeFetchRequest(fetchRequest)
            
        }
        catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        return result;
        
    }
    
   // save Employee Record.
    
    class func JAsaveEmployeeRecord(forManagerName managerEmail:NSString!, employEmail: String!, phoneNumber:NSString!, address:NSString!)->Bool
    {
        var result: Bool = false
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext   =  appDel.managedObjectContext
        let managerDetails : Employees?      =  NSEntityDescription.insertNewObjectForEntityForName("Employees", inManagedObjectContext:managedContext) as? Employees
        
        
        if let objUser = managerDetails
        {
            objUser.mangEmail = managerEmail as String
            objUser.empName = employEmail as String
            objUser.empAddress = address as String
            objUser.phoneNumber = phoneNumber as String
            
            let objManager  =  self.JAFetchManagerRecordWith(forManagerEmail: managerEmail!)[0] as! Manager
            objUser.rEmployee = objManager
            
            do {
                try objUser.managedObjectContext?.save()
                result = true
            } catch {
                result =  false
                let saveError = error as NSError
                print(saveError)
            }
            
        }
        return result
    }
    // Fech all Employee
    class func JAFetchAllEmployeeWith(forManagerEmail email:NSString!)->NSArray!
    {
        var result = [];
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext   =  appDel.managedObjectContext
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Employees", inManagedObjectContext:managedContext)
        fetchRequest.entity = entityDescription
        let predicate = NSPredicate(format: "mangEmail == %@", email!)
        fetchRequest.predicate = predicate
        do
        {
            try result = managedContext.executeFetchRequest(fetchRequest)
            
        }
        catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        return result;
    }
    
    // Fech manager Details Employee
    class func JAFetchManagerRecordWith(forManagerEmail email:NSString!)->NSArray!
    {
        var result = [];
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext   =  appDel.managedObjectContext
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Manager", inManagedObjectContext:managedContext)
        fetchRequest.entity = entityDescription
        let predicate = NSPredicate(format: "mangEmail == %@", email!)
        fetchRequest.predicate = predicate
        do
        {
            try result = managedContext.executeFetchRequest(fetchRequest)
            
        }
        catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        return result;
    }
   // Delete the manager Record
   class func deleteManagerRecordWith(forManagerEmail emailID: String!)->Bool{
    let arrResult : NSArray?
    var result = false
    let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedContext   =  appDel.managedObjectContext
    let fetchRequest = NSFetchRequest()
    let entityDescription = NSEntityDescription.entityForName("Manager", inManagedObjectContext:managedContext)
    fetchRequest.entity = entityDescription
    let predicate = NSPredicate(format: "mangEmail == %@", emailID! )
    fetchRequest.predicate = predicate
    
    do {
        
        arrResult =   try managedContext.executeFetchRequest(fetchRequest)
        
        if let arrData = arrResult
        {
            for result: AnyObject in arrData{
                
                appDel.managedObjectContext.deleteObject(result as! NSManagedObject)
            }
            try appDel.managedObjectContext.save()
            
            result = true
        }
        
    }
    catch let error as NSError {
        // failure
        result = false
        print("Fetch failed: \(error.localizedDescription)")
    }
    return result
}
}