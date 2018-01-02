/*
 * EditTaskViewController.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Jan 03, 2018
 * Description: Form Screen to modify task name and description as well as a switch view to set the
 *              task as active or completed.
 * Version: 0.2
 */
import UIKit

class EditTaskViewController: UIViewController {

    // Local variables for the task information from the root controller, and for storing the modified info performed in the screen
    var selectedTask: Task! = nil
    var modifiedTask: Task! = nil
    
    // OUTLETS
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
    @IBOutlet weak var taskStatusLabel: UILabel!
    
    @IBOutlet weak var taskStatusSwitch: UISwitch!
    
    
    // OVERRIDE METHODS FOR UIVIEWCONTROLLER PROTOCOL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fill selected task data retrieved from root controller to the corresponding views
        if selectedTask != nil {
            taskNameTextField.text = selectedTask.name
            taskDescriptionTextView.text = selectedTask.notes
            taskStatusLabel.text = selectedTask.completed ? Constants.Text.CompletedTask : Constants.Text.ActiveTask
            taskStatusSwitch.isOn = !selectedTask.completed
        }
        
        // Initialize modified task object to store selected task from root controller
        modifiedTask = Task(selectedTask)
    }
    

    // ACTIONS
    
    @IBAction func onSwitchValueChanged(_ sender: UISwitch) {
        // Color to be used for Active Task or Completed Task
        let activeColorForStatusText = UIColor(red: Utils.rgbHexaComponentToDecimal("A0"),
                                               green: Utils.rgbHexaComponentToDecimal("00"),
                                               blue: Utils.rgbHexaComponentToDecimal("00"), alpha: 1)
        
        let completedColorForStatusText = UIColor(red: Utils.rgbHexaComponentToDecimal("A1"),
                                                  green: Utils.rgbHexaComponentToDecimal("A2"),
                                                  blue: Utils.rgbHexaComponentToDecimal("A1"), alpha: 1)
        
        // Set label text in the screen, and update the modified task copy
        modifiedTask.completed = !sender.isOn
        taskStatusLabel.text = sender.isOn ? Constants.Text.ActiveTask : Constants.Text.CompletedTask
        taskStatusLabel.textColor = sender.isOn ? activeColorForStatusText : completedColorForStatusText
    }
    
    @IBAction func onCancelButtonPressed(_ sender: UIButton) {
        
        //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        //let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TasksList") as! RootViewController
        
        // To present next view controller on top of the current controller
        //self.present(nextViewController, animated:true, completion:nil)
        
        // To push next view controller to the navigation stack. It shows a back button
        //self.navigationController?.pushViewController(nextViewController, animated: true)
        
        // Pops the current view controller, previous controller shows up
        self.navigationController?.popViewController(animated:true)
        
        // This will performs a direct jump to root view controller
        //self.navigationController?.popToRootViewController(animated:true)
    }
    
    @IBAction func onDeleteButtonPressed(_ sender: UIButton) {
        // Remove task from TaskList Singleton and redirect to the Tasks List screen
        TasksList.sharedTasksList.removeTask(aTask: selectedTask)
        self.navigationController?.popViewController(animated:true)
    }
    
    @IBAction func onUpdateButtonPressed(_ sender: UIButton) {
        //TO DO:
        // 1. Show a Alert with confirmation, that the user is about to modify the task
        // 2. Save modifiedTask object values to selectedTask object and save the TasksList
    }
}
