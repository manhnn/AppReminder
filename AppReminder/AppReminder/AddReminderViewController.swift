//
//  AddReminderViewController.swift
//  AppReminder
//
//  Created by Nguyen Manh on 30/12/2020.
//

import UIKit

protocol AddRemiderDelegate {
    func didAddNewTodo()
}

class AddReminderViewController: UIViewController {
    
    
    @IBOutlet weak var txtWork: UITextField!
    
    @IBOutlet weak var txtTime: UITextField!
    
    @IBOutlet weak var txtImage: UITextField!
    
    var newReminder = Reminder(work: "", time: "", isSuccess: false, image: "")
    
    var delegate: AddRemiderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaveAction(_ sender: Any) {
        if (txtWork.text == "" || txtWork.text == "" || txtImage.text == "") {
            let alertController = UIAlertController(title: "Warrning", message: "Please set full information", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default){ (action) in}
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            //Add newReminder to listData
            newReminder.work = String(txtWork.text!)
            newReminder.time = String(txtTime.text!)
            newReminder.image = String(txtImage.text!)
            
            listReminder.append(newReminder)
            navigationController?.popViewController(animated: true)
            let mainViewController = self.navigationController?.topViewController as? ToDoListViewController
            
            //mainViewController?.myTable?.reloadData()
            
            delegate?.didAddNewTodo()//giao viec cho thang khac
            
        }
    }
    
}


