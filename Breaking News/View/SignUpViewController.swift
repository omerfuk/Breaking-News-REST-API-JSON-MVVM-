//
//  SignUpViewController.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 15.06.2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    
    var K = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign UP News"
        titleLabel.text = ""
        titleLabel.textColor = .orange
        warningLabel.textColor = .red
        warningLabel.isHidden = true
        
        K.buttonRadiuser(button: signUpButton)
        K.labelAnimation(titleLabel: titleLabel)
        
 
        
    }
    
    func validateFields() {
        
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            warningLabel.text = "Missing Fields!.."
            warningLabel.isHidden = false
            
            let alert = K.alertSender(title1: "Sign Up ERROR", message: "Fields Cannot Be Empty!..")
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        validateFields()
        
        //Register User
            //getting cleaned text in textfields
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let surname = surnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Creating the user
        
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            
            if err != nil {
                //it means there is an error occured
                print(err)
            }
            else{
                //it means no error found, so user created successfully, now store the name and username
                
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["name": name, "surname": surname, "uid": result!.user.uid]) { error in
                    
                    if error != nil {
                        //it means there is an error
                        print(error)
                    }
                    else{
                        //No error found,
                        
                        
                        //there is two solutions that i made, they allows user to see an alert while view changing about success
                        
                        //Solution 1
                        DispatchQueue.main.async {
                            let alert = self.K.alertSender(title1: "Success", message: "You have been registered successfully")
                            self.present(alert, animated: true, completion: nil)
                            
                        }
                        self.transitionToMainPage()
                        
                        //Solution 2
                        
//                        let alert = UIAlertController(title: "Success", message: "You have been registered successfully", preferredStyle: .alert)
//                        let okAction = UIAlertAction(title: "OK", style: .default) { alert in
//                            self.transitionToMainPage()
//                        }
//                        alert.addAction(okAction)
//                        self.present(alert, animated: true, completion: nil)
                        
                    }
                }
            }
        }
        
        
        
    }
    
    func transitionToMainPage(){
        navigationController?.popToRootViewController(animated: true)
    }
    

}
