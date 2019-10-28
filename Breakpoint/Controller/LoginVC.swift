//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Kirolos on 9/9/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnpressed(_ sender: Any) {
        
        if email.text != nil && password.text != nil {
            AuthService.instance.loginUser(email: self.email.text!, password: self.password.text!) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    print(String(describing: error))
                }
                
                AuthService.instance.registerUser(email: self.email.text!, password: self.password.text!, userComplition: { (success, error) in
                    if success {
                        AuthService.instance.loginUser(email: self.email.text!, password: self.password.text!, loginComplete: { (success, error) in
                            self.dismiss(animated: true, completion: nil)
                        })
                    }
                    else{
                        print(String(describing: error))
                    }
                })
                
                
                
            }
            
        }
        
        
    }
    
    @IBAction func closepressd(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
