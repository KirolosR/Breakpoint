//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Kirolos on 9/9/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginEmailpressed(_ sender: Any) {
        let loginVc = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVc!, animated: true, completion: nil)
    }
    

}
