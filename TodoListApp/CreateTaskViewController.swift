/*
 * CreateTaskViewController.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Jan 03, 2018
 * Description: Form Screen to type in task name and description for the new task
 * Version: 0.2
 */
import Foundation
import UIKit

class CreateTaskViewController: UIViewController, UITextViewDelegate {

    // Constant text used for Task Description place holder
    private let descriptionPlaceHolder: String = Constants.Text.DescriptionPlaceHolder
    
    // OUTLETS
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
    
    // OVERRIDDE FUNCTIONS FOR UIVIEWCONTROLLER PROTOCOL
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // FUNCTION FOR IMPLEMENTING UITEXVIEWDELEGATE PROTOCOL
    
    // Delegate Functions for removing the place holder when user start typing in the text view
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == descriptionPlaceHolder)
        {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    // Delegate Functions for adding a place holder when there is no focus on the text view and user did not typed in data
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text == "")
        {
            textView.text = descriptionPlaceHolder
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }

    
    // ACTION FUNCTIONS
    
    @IBAction func onCancelButtonPressed(_ sender: UIButton) {
        // Pops current view controller out from the nav stack, previous controller shows up
        self.navigationController?.popViewController(animated:true)
    }
    
    @IBAction func onCreateButtonPressed(_ sender: UIButton) {
        //Create new task and save it using the TaskList api
        let newTask = Task(taskNameTextField.text!, taskDescriptionTextView.text!, false)
        TasksList.sharedTasksList.addTask(aTask: newTask)
        
        // Pops current view controller out from the nav stack, previous controller shows up
        self.navigationController?.popViewController(animated:true)
    }
    
    // Allows us detect when user finishes editing task name or task description
    // At that moment editing views should lose focus, in order to hide the phone software keyboard
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        taskNameTextField.resignFirstResponder()
        taskDescriptionTextView.resignFirstResponder()
    }
    
}
