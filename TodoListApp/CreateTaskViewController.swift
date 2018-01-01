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

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskNameTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onCancelButtonPressed(_ sender: UIButton) {
        // Pops the current view controller, previous controller shows up
        self.navigationController?.popViewController(animated:true)
    }
    
    @IBAction func onCreateButtonPressed(_ sender: UIButton) {
    }
}
