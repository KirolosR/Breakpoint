//
//  FirstViewController.swift
//  Breakpoint
//
//  Created by Kirolos on 5/3/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.getAllMessages { (messageFeed) in
            self.messageArray = messageFeed
        }
        tableView.reloadData()
        
    }


}
extension FeedVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? Feedcell else { return  UITableViewCell()}
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        cell.profileImage.image = image 
        cell.email.text = message.senderId
        cell.mesaageContent.text = message.content
        
        return cell
    }
    
}
    
    

