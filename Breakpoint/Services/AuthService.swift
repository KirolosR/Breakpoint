//
//  AuthService.swift
//  Breakpoint
//
//  Created by Kirolos on 9/9/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FileProvider

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(email : String , password : String , userComplition : @escaping (_ status : Bool , _ error : Error?) -> ())  {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userComplition(false,error!)
                return
            }
            
            let userData = ["Provider" : user.user.providerID , "email" : user.user.email]
            DataService.instance.CreateUser(uid: user.user.uid, userdata: userData)
            userComplition(true,nil)
        }
        
    }
        
        
        func loginUser (email : String , password : String , loginComplete : @escaping (_ status : Bool , _ error : Error?) -> ()){
            
            Auth.auth().signIn(withEmail: email, password: password) { (user , error) in
                guard let user = user else {
                    loginComplete(false,nil)
                    return
                }
                loginComplete(true,nil)
            }
        }
    
    
    
    
    
    
    
    
}

