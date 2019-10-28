//
//  DataService.swift
//  Breakpoint
//
//  Created by Kirolos on 9/5/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase
import FirebaseAuth

let DB_BASE = Database.database().reference()


class DataService {
    
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USER = DB_BASE.child("users")
    private var _REF_GROUP = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feeds")
    
    var  REF_BASE : DatabaseReference {
        return _REF_BASE
    }
    var REF_USER : DatabaseReference {
        return _REF_USER
    }
    var REF_GROUP : DatabaseReference {
        return _REF_GROUP
    }
    var REF_FEED : DatabaseReference {
        return _REF_FEED
    }
    
    
    func CreateUser (uid : String , userdata : Dictionary<String , Any>){
        REF_USER.child(uid).updateChildValues(userdata)
    }
    
    func uploadMessage(message : String , uid : String , groupKey : String? , sendComplete : @escaping (_ status : Bool) -> ()) {
        
        if groupKey != nil {
            
        }
        else {
            REF_FEED.childByAutoId().updateChildValues(["content" : message , "senderid" : uid])
            sendComplete(true)
        }
        
    }
    
    
    func getAllMessages(_ handeler : @escaping (_ message : [Message])->()) {
        
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value ) { (messageSnapshot) in
            guard let messageSnapshot = messageSnapshot.children.allObjects as? [DataSnapshot] else {return }
            
            for mess in messageSnapshot {
                let content = mess.childSnapshot(forPath: "content").value as! String
                let sender = mess.childSnapshot(forPath: "senderid").value as! String
                var message = Message(content,sender)
                messageArray.append(message)
           }
            handeler(messageArray)
        }
        
        
        
        
    }
    
    
    
    
    
    
}
