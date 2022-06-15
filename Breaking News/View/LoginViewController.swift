//
//  LoginViewController.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 15.06.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    var K = Constants()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login News"
        warningLabel.textColor = .red
        warningLabel.isHidden = true
        
        
        K.buttonRadiuser(button: loginButton)
        
        K.labelAnimation(titleLabel: self.titleLabel)
//        self.navigationItem.hidesBackButton = true
        
        
       
    }
    
    
    func validateFields(){
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            warningLabel.text = "Missing Fields!.."
            warningLabel.isHidden = false
            
            //From Constants Class, extension alertSender() Func called.
            let alert = K.alertSender(title1: "Login ERROR", message: "Fields Cannot Be Empty!..")
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        validateFields()
        
        //getting clean text of email and password.
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if error != nil {
                //it means there is an error occured
                print(error)
                let alert = self.K.alertSender(title1: "Warning", message: "Error :\(error!.localizedDescription)")
                self.present(alert, animated: true, completion: nil)
            }
            
            else{
                
                //it means there is no error occured, user successfully logged in..
                
                self.performSegue(withIdentifier: "loginToArticle", sender: nil)
                
                
            }
        }
        
    }
    
}
