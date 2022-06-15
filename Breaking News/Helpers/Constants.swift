//
//  Constants.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 15.06.2022.
//

import Foundation
import UIKit

class Constants {
    
    static let appName:String = "📰Breaking News📰"
    
    
}


extension Constants {
    //for buttons corner radius'
    func buttonRadiuser(button:UIButton){
        button.layer.cornerRadius = button.frame.size.height / 2
    }
    
    func labelAnimation(titleLabel: UILabel) {
        var charIndex = 0.0

                for character in Constants.appName {
                    Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) {
                        (timer) in titleLabel.text?.append(character)
                    }
                    charIndex += 1
                }
    }
    
    func alertSender(title1:String, message:String) -> UIAlertController {
        
        let alert = UIAlertController(title: title1, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        return alert
    }
    
}


