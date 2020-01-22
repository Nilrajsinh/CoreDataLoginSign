//
//  ViewController.swift
//  CoreDataLoginSignup
//
//  Created by Nilrajsinh Vaghela on 17/01/20.
//  Copyright © 2020 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    @IBAction func Login(_ sender: Any) {
        
        
        let UEmail = Email.text!
        let UPass = Password.text!
        
        if (UEmail != "" || UPass != "") {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let managecontext = appdelegate.persistentContainer.viewContext
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            req.predicate = NSPredicate(format: "email = %@", UEmail)
            
            req.returnsObjectsAsFaults = false
               
               do {
                   let result = try managecontext.fetch(req)
                   
                   for data in result as! [NSManagedObject] {
                       let passwordFromData = data.value(forKey: "password") as! String
                       if UPass == passwordFromData {
                           print("Success")
                       }
                   }
               } catch let err as NSError {
                   print("Could not, \(err), \(err.localizedDescription)")
               }
            
            
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

