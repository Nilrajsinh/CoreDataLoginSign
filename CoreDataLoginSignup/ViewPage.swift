//
//  ViewPage.swift
//  CoreDataLoginSignup
//
//  Created by Nilrajsinh Vaghela on 23/01/20.
//  Copyright © 2020 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit
import CoreData

class ViewPage: UIViewController {
    
      var people: [NSManagedObject] = []
    
    
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var NameV: UITextField!
    @IBOutlet weak var EmailV: UITextField!
    @IBOutlet weak var PasswordV: UITextField!
    @IBOutlet weak var GenderSegment: UISegmentedControl!
    
    @IBOutlet weak var CityPickerView: UIPickerView!
    
    var userData2 = [String]()
    
    @IBAction func Save(_ sender: UIButton) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
          appDelegate.persistentContainer.viewContext
     
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
          people = try managedContext.fetch(fetchRequest)
            for data in people as! [NSManagedObject] {
                //print(data.value(forKey: "name")!)
                //print(data.value(forKey: "email")!)
               // print(data.value(forKey: "password")!)
                print(userData2)
                EmailV.text = userData2[0]
                PasswordV.text = userData2[1]
              
                
            }
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        // Do any additional setup after loading the view.
        let usermail = userData2[0] as String
        let userpassword = userData2[1] as String
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
