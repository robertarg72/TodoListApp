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

    var selectedTask: Task! = nil
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
    @IBOutlet weak var taskStatusLabel: UILabel!
    
    @IBOutlet weak var taskStatusSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fill selected task data to the corresponding views
        if selectedTask != nil {
            taskNameTextField.text = selectedTask.name
            taskDescriptionTextView.text = selectedTask.notes
            taskStatusLabel.text = selectedTask.completed ? Constants.Text.CompletedTask : Constants.Text.ActiveTask
            taskStatusSwitch.isOn = !selectedTask.completed
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSwitchValueChanged(_ sender: UISwitch) {
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
    }
    
    @IBAction func onUpdateButtonPressed(_ sender: UIButton) {
    }
}
