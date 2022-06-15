//
//  WelcomeViewController.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 15.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var K = Constants()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
        titleLabel.text = ""
        K.labelAnimation(titleLabel: self.titleLabel)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        K.buttonRadiuser(button: loginButton)
        K.buttonRadiuser(button: signUpButton)
        
        
    }
    
    

    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
}


