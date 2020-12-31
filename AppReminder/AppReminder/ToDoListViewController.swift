//
//  ViewController.swift
//  AppReminder
//
//  Created by Nguyen Manh on 30/12/2020.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var btnAddReminder: UIButton!
   //cut data
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listReminder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "CELL") as! RowOfTableViewCell
        
        cell.lblWork.text = listReminder[indexPath.row].work
        cell.lblTime.text = listReminder[indexPath.row].time
        
        
        if listReminder[indexPath.row].isSuccess == true {
            cell.contentView.backgroundColor = UIColor.green
        }
        else {
            cell.contentView.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let reminderDetailDisplay = storyboard.instantiateViewController(withIdentifier: "reminderDetailDisplay") as! ReminderDetailViewController
        
        reminderDetailDisplay.workName = "Work: \(listReminder[indexPath.row].work)"
        reminderDetailDisplay.timeName = "Time: \(listReminder[indexPath.row].time)"
        reminderDetailDisplay.successName = "Success: \(listReminder[indexPath.row].isSuccess)"
        reminderDetailDisplay.imageName = listReminder[indexPath.row].image
    
        
        //reminderDetailDisplay.lblWork.text = "Work: \(listReminder[indexPath.row].work)"
        //reminderDetailDisplay.lblTime.text = "Time: \(listReminder[indexPath.row].time)"
        //reminderDetailDisplay.lblSuccess.text = "Success: \(listReminder[indexPath.row].isSuccess)"
        
        self.navigationController?.pushViewController(reminderDetailDisplay, animated: true)
    }
    
    @IBAction func btnAddReminderActionUpRight(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addReminder = storyboard.instantiateViewController(withIdentifier: "addReminderViewController") as! AddReminderViewController
        //bat dau load man add thi gan reminder delegate o day -> chuyen sang man add
        addReminder.delegate = self
        self.navigationController?.pushViewController(addReminder, animated: true)
    }
    
    
    
    //Delete + update a cell
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let reminder = listReminder[indexPath.row]
        
        let successAction = UITableViewRowAction(style: .default, title: "Success"){(action, indexPath) in
            self.updateAction(reminder: reminder, indexPath: indexPath)
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") {action, indexPath in
            self.deleteAction(reminder: reminder, indexPath: indexPath)
        }
        
        deleteAction.backgroundColor = .red
        successAction.backgroundColor = .green
        
        return [deleteAction, successAction]
    }
    
    private func updateAction(reminder: Reminder, indexPath: IndexPath) {
       
        listReminder[indexPath.row].isSuccess = true
        
        if let cell = myTable.cellForRow(at: IndexPath.init(row: indexPath.row, section: 0)) as? RowOfTableViewCell{
            if(listReminder[indexPath.row].isSuccess == true){
                
                cell.contentView.backgroundColor = UIColor.green
                //myTable.reloadData()
            }
        }
        
    }
    
    private func deleteAction(reminder: Reminder, indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete reminder?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            listReminder.remove(at: indexPath.row)
            self.myTable?.deleteRows(at: [indexPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.delegate = self
        myTable.dataSource = self
        
        
    }


}

extension ToDoListViewController: AddRemiderDelegate {
    func didAddNewTodo() {
        myTable.reloadData()
        //print(listReminder[listReminder.count - 1].work)
        //dc giao viec lam ho thang ben kia reload data
    }
}

