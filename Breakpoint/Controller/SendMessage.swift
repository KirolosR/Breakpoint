//
//  SendMessage.swift
//  Breakpoint
//
//  Created by Kirolos on 9/15/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit
import FirebaseAuth

class SendMessage: UIViewController {

    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBOutlet weak var ProfileLable: UILabel!
    
    @IBOutlet weak var textMessage: UITextView!
    
    @IBOutlet weak var send: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textMessage.delegate = self
       send.bindKeboard()
    }

    
    @IBAction func SendPressed(_ sender: Any) {
        if textMessage.text != nil && textMessage.text != "say something here..." {
            send.isEnabled = false
            DataService.instance.uploadMessage(message: textMessage.text, uid: (Auth.auth().currentUser?.uid)!, groupKey: nil) { (success) in
                if success {
                    self.send.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        else  {
            self.send.isEnabled = true
            print("there was an error !")
        }
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
    
extension SendMessage : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textMessage.text = ""
    }
}
    
    
    

