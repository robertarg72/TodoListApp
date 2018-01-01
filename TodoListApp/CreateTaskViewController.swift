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
import UIKit

class CreateTaskViewController: UIViewController, UITextViewDelegate {

    // Constant text used for Task Description place holder
    private let descriptionPlaceHolder: String = Constants.Text.DescriptionPlaceHolder
    
    // OUTLETS
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskNameTextView: UITextView!
    
    
    // OVERRIDDE FUNCTIONS FOR UIVIEWCONTROLLER PROTOCOL
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // FUNCTION FOR IMPLEMENTING UITEXVIEWDELEGATE PROTOCOL
    // Delegate Functions for adding a place holder for the Task Description Text View
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == descriptionPlaceHolder)
        {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
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
        // Pops the current view controller, previous controller shows up
        self.navigationController?.popViewController(animated:true)
    }
    
    @IBAction func onCreateButtonPressed(_ sender: UIButton) {
    }
}
