/*
 * ViweController.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Dec 20, 2017
 * Description: Hierarchical Navigation using a table view to show Todo tasks items
 *              Each task has a switch view to mark a task as completed,
 *              and a button that will open a new screen to show the task details.
 * Version: 0.1
 */

import UIKit

// Helper class to manage a Custom Cell with switch view and buttton
class TaskViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var completed: UISwitch!
    
    @IBAction func onEditButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func onSwitchViewChange(_ sender: UISwitch) {
    }
}

// Main controller for first table view showing list of taks
class RootViewController: UITableViewController {
    // Private variables
    private var cellPointSize: CGFloat!
    private var tasksList: TasksList!
    private static let taskCell = "TaskName"
    
    // Overriden methods for UITableViewController protocol
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksList = TasksList.sharedTasksList
        let  preferredTableViewFont =  UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
    }
    
    //Datasource methods for table view
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All your tasks"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.tasks.count
    }
    
    override
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline).pointSize * 5
    }
    
    override
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.taskCell, for: indexPath) as! TaskViewCell
        
        cell.name?.text = tasksList.tasks[indexPath.row].name
        //cell.name?.font = UIFont(name: "Arial", size: cellPointSize)
        if tasksList.tasks[indexPath.row].completed {
            cell.completed?.isOn = false
            cell.name?.textColor = UIColor(red: rgbHexaComponentToDecimal("E1"),
                                           green: rgbHexaComponentToDecimal("E2"),
                                           blue: rgbHexaComponentToDecimal("E1"), alpha: 1)
        }
        
        return cell
    }
    
    // Segue connection method
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
//        let listVC = segue.destination as! FontListViewController
//
//        if indexPath.section == 0 {
//            let familyName = tasksNames[indexPath.row]
//            listVC.fontNames = (UIFont.fontNames(forFamilyName: familyName) as [String]).sorted()
//            listVC.navigationItem.title = familyName
//            listVC.showsFavourites = false
//        }
//        else {
//            listVC.fontNames = tasksList.favourites
//            listVC.navigationItem.title = "Favourites"
//            listVC.showsFavourites = true
//        }
//    }
    
    // Private functions
    
    // This function convert a RGB component to standarized CG value
    private func rgbHexaComponentToDecimal(_ hexa:String) -> CGFloat{
        if let decimal = UInt8(hexa, radix: 16) {
            return CGFloat(decimal) / 255.0
        }
        return 0
    }
    
    
    
    
}


