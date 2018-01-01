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

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
    @IBOutlet weak var taskStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSwitchValueChanged(_ sender: UISwitch) {
    }
    
    @IBAction func onCancelButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func onDeleteButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func onUpdateButtonPressed(_ sender: UIButton) {
    }
}
