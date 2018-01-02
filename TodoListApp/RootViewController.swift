/*
 * RootViewController.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Jan 03, 2018
 * Description: Hierarchical Navigation using table views to show Todo tasks items
 *              Each task has a switch view to mark it as completed,
 *              and a button that will open the edit details screen.
 *              A floating static button for creating a new task.
 * Version: 0.2
 */

import UIKit

// Helper class to manage a Custom Cell with switch view and buttton inside
class TaskViewCell: UITableViewCell {
    
    // internal variable to store the row for the current cell
    var row: Int = 0
    
    // OUTLETS
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var completed: UISwitch!
    @IBOutlet weak var editButton: UIButton!
    
    // ACTIONS
    @IBAction func onEditButtonPressed(_ sender: UIButton) {
        // Do nothing for now. Going to Details screen is managed by the segue.
    }
    
    @IBAction func onSwitchViewChange(_ sender: UISwitch) {
        // Change views values in the cell, according to the switch status
        if( completed!.isOn ) {
            let enabledColorForName = UIColor(red: Utils.rgbHexaComponentToDecimal("61"),
                                              green: Utils.rgbHexaComponentToDecimal("61"),
                                              blue: Utils.rgbHexaComponentToDecimal("61"), alpha: 1)
            
            let enabledColorForButtonTitle = UIColor(red: Utils.rgbHexaComponentToDecimal("A0"),
                                                     green: Utils.rgbHexaComponentToDecimal("00"),
                                                     blue: Utils.rgbHexaComponentToDecimal("00"), alpha: 1)
           
            editButton.setTitleColor(enabledColorForButtonTitle, for: .normal)
            editButton.isEnabled = true
            name!.textColor = enabledColorForName
            
            
        }
        else {
            editButton.isEnabled = false
            editButton.setTitleColor(.gray, for: .normal)
            name!.textColor = UIColor(red: Utils.rgbHexaComponentToDecimal("E1"),
                                      green: Utils.rgbHexaComponentToDecimal("E2"),
                                      blue: Utils.rgbHexaComponentToDecimal("E1"), alpha: 1)
            
        }
        
        // Update the corresponding task and update the singleton TasksList
        let currentTask = TasksList.sharedTasksList.tasks[row]
        currentTask.completed = !completed!.isOn
        TasksList.sharedTasksList.updateTask(aTask: currentTask)
    }
}

// Main controller for first table view showing list of taks
class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Private variables
    private var cellPointSize: CGFloat!
    private var tasksList: TasksList!
    private static let taskCell = "TaskName"
    @IBOutlet weak var todoListTableView: UITableView!
    
    
    // OVERRIDDE FUNCTIONS FOR UIVIEWCONTROLLER PROTOCOL
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 800.0)
        //tableView.reloadData()
        todoListTableView!.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 800.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tasksList = TasksList.sharedTasksList
        let  preferredTableViewFont =  UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        //tableView.estimatedRowHeight = cellPointSize
        todoListTableView!.estimatedRowHeight = cellPointSize
        
        navigationController?.navigationBar.barTintColor = UIColor(
                        red: Utils.rgbHexaComponentToDecimal("DD"),
                        green: Utils.rgbHexaComponentToDecimal("2D"),
                        blue: Utils.rgbHexaComponentToDecimal("01"), alpha: 1)
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 26, weight: .semibold)
        ]
        
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(-10), for: UIBarMetrics.default)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil,  action: nil)
       
    }
  
    
    // FUNCTIONS FOR TABLE VIEW FOR IMPLEMENTING DATASOURCE AND DELEGATE PROTOCOLS

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.tasks.count
    }
   
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return tasksList.tasks[indexPath.row].completed ? nil : indexPath
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline).pointSize * 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoListTableView!.dequeueReusableCell(withIdentifier: RootViewController.taskCell, for: indexPath) as! TaskViewCell
        
        cell.name?.text = tasksList.tasks[indexPath.row].name
        cell.row = indexPath.row
        if tasksList.tasks[indexPath.row].completed {
            cell.completed?.isOn = false
            cell.completed?.isEnabled = false
            cell.editButton?.isEnabled = false
            cell.editButton?.setTitleColor(.gray, for: .normal)
            cell.name?.textColor = UIColor(red: Utils.rgbHexaComponentToDecimal("E1"),
                                           green: Utils.rgbHexaComponentToDecimal("E2"),
                                           blue: Utils.rgbHexaComponentToDecimal("E1"), alpha: 1)
        }
        
        // Set button tag to the cell order row, so we have that info for the segue action
        cell.editButton?.tag = indexPath.row
        
        return cell
    }
    
    // SEGUE CONNECTION METHOD
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.Text.EditTaskSegueIdentifier {
            // Set destination view controller
            let editTaskVC = segue.destination as! EditTaskViewController
            
            // Set information for selected task in the following view controller
            // Row order is retreived from the button tag
            editTaskVC.selectedTask = tasksList.tasks[(sender as! UIButton).tag]
        }
        
    }
    
    
}


