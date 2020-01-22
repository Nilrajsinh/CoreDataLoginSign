//
//  SignUp.swift
//  CoreDataLoginSignup
//
//  Created by Nilrajsinh Vaghela on 17/01/20.
//  Copyright © 2020 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit
import CoreData

class SignUp: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
      var people: [NSManagedObject] = []
    
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Gender: UISegmentedControl!
    
    @IBOutlet weak var Register: UIButton!
    
    
    
    @IBAction func RegiterBtn(_ sender: UIButton) {
        
        let UserImage = Img.image!.jpegData(compressionQuality: 1.0)
         let ImgPng = UserImage?.base64EncodedString(options: .lineLength64Characters)
              
              let gnd = Gendd[Gender.selectedSegmentIndex]
        
        
        self.save(name: Name.text!, email: Email.text!, pass: Password.text!, gender: gnd, image: ImgPng!)
        
        
    }
   
    var Gendd = ["Male","Female","Other"]
    
    var demo = [""]
    
    
    func save(name:String,email:String,pass:String,gender:String, image:String){
        
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        let managecontext = appdelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managecontext!)
        let persone =  NSManagedObject(entity: entity!, insertInto: managecontext)
       
      
      
        
        persone.setValue(Name.text, forKey: "name")
        persone.setValue(Email.text, forKey: "email")
        persone.setValue(Password.text, forKey: "password")
       persone.setValue(gender, forKey: "gender")
      persone.setValue(image, forKey: "image")
        
        
        do {
            try managecontext!.save()
            people.append(persone)
           
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
        
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapgest = UITapGestureRecognizer()
        tapgest.addTarget(self, action: #selector(SignUp.opengalary(tapgest:)))
        Img.isUserInteractionEnabled = true
        Img.addGestureRecognizer(tapgest)
        // Do any additional setup after loading the view.
    }
    
    @objc func opengalary(tapgest: UITapGestureRecognizer) {
           self.setmyimg()
       }
     
     let imagepicker = UIImagePickerController()
     
       func setmyimg(){
           if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
               imagepicker.sourceType = .photoLibrary
               imagepicker.delegate = self
               imagepicker.isEditing = true
               self.present(imagepicker, animated: true, completion: nil)
           }
       }
       
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let imagee = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
           Img.image = imagee
           self.dismiss(animated: true, completion: nil)
           
           
       }
     
    


}
