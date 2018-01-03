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
        // Play a sound when button is pressed
        Utils.playSound(file: "Pop", ext: "aiff")
        
        Utils.updateCellStyleAccordingToSwitchValue(name, editButton, completed)
        
        // Update the corresponding task and update the singleton TasksList
        let currentTask = TasksList.sharedTasksList.tasks[row]
        currentTask.completed = !completed!.isOn
        TasksList.sharedTasksList.updateTask(aTask: currentTask)
    }
}

// Main controller for first table view showing list of taks
class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    // Private variables
    private var cellPointSize: CGFloat!
    private var tasksList: TasksList!
    private static let taskCell = "TaskName"
    @IBOutlet weak var todoListTableView: UITableView!
    
    // Private constants for setting up color used in this screen
    
    
    // OVERRIDDE FUNCTIONS FOR UIVIEWCONTROLLER PROTOCOL
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 800.0)
        //tableView.reloadData()
        todoListTableView!.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //todoListTableView!.reloadData()
        //self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 800.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the singleton shared list of tasks
        tasksList = TasksList.sharedTasksList
        
        // Set up the font attributes, tint color, and title position for the navigation bar
        let  preferredTableViewFont =  UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        todoListTableView!.estimatedRowHeight = cellPointSize
        navigationController?.navigationBar.barTintColor = Constants.Color.tintColorForNavigationBar
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 26, weight: .semibold)
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(-10), for: UIBarMetrics.default)
        
        // Modify the text for the default "Back Button" in the navigation bar
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil,  action: nil)
    }
  
    
    // FUNCTIONS FOR TABLE VIEW FOR IMPLEMENTING DATASOURCE AND DELEGATE PROTOCOLS

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.tasks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline).pointSize * 5
    }
 
    // Allows to perform a quick delete right from the main list of tasks, by doing swipe to the left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Play a sound when button is pressed
            Utils.playSound(file: "Pop", ext: "aiff")
            
            // Show a confirmation alert before deleting the task
            let deleteConfirmationAlert = UIAlertController(title: "Delete Task", message: "Task will be deleted. Continue?", preferredStyle: UIAlertControllerStyle.alert)
            
            deleteConfirmationAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                // Remove task from TaskList Singleton and reload table view list
                let selectedTask = TasksList.sharedTasksList.tasks[indexPath.row]
                TasksList.sharedTasksList.removeTask(aTask: selectedTask)
                self.todoListTableView.reloadData()
            }))
            
            deleteConfirmationAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                // Do nothing. Stays in current screen.
            }))
            
            present(deleteConfirmationAlert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoListTableView!.dequeueReusableCell(withIdentifier: RootViewController.taskCell, for: indexPath) as! TaskViewCell
        cell.name?.text = tasksList.tasks[indexPath.row].name
        
        // Save cell row position in the table view, for updating each task when switch changed event happens
        cell.row = indexPath.row

        cell.completed?.isOn = !tasksList.tasks[indexPath.row].completed
        Utils.updateCellStyleAccordingToSwitchValue(cell.name, cell.editButton, cell.completed)
        
        // Set button tag to the cell order row, so we have that info for the segue action
        cell.editButton?.tag = indexPath.row
        
        return cell
    }
    
    // SEGUE CONNECTION METHOD
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Play a sound when button is pressed
        Utils.playSound(file: "Pop", ext: "aiff")
        
        if segue.identifier == Constants.Text.EditTaskSegueIdentifier {
            // Set destination view controller
            let editTaskVC = segue.destination as! EditTaskViewController
            
            // Set information for selected task in the following view controller
            // Row order is retreived from the button tag
            editTaskVC.selectedTask = tasksList.tasks[(sender as! UIButton).tag]
        }
        
    }
}


