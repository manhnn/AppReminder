//
//  ReminderDetailViewController.swift
//  AppReminder
//
//  Created by Nguyen Manh on 30/12/2020.
//

import UIKit

class ReminderDetailViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblWork: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblSuccess: UILabel!
    
    var imageName: String!
    var workName: String!
    var timeName: String!
    var successName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.image.image = UIImage(named: imageName)
        self.lblWork.text = workName
        self.lblTime.text = timeName
        self.lblSuccess.text = successName
    }
    

}
