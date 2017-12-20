/*
 * TasksList.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Dec 20, 2017
 * Description: 
 *              Class to describe and manage todo tasks, as a collections of tasks
 * Version: 0.1
 */

import Foundation
import UIKit

class TasksList {
    static let sharedTasksList = TasksList()
    private(set) var tasks:[Task]
    
    init(){
        let defaults = UserDefaults.standard
        let storedTasks = defaults.object(forKey: "tasks") as? [Task]
        tasks = storedTasks != nil ? storedTasks! : []
    }
    
    // This method adds a new task to the user preferences file
    func addTask(aTask: Task?) {
        
        if let currentTask = aTask {
            if !tasks.contains(currentTask) {
                tasks.append(currentTask)
                saveTask()
            }
        }
    }
    
    // This method removes a specific task from the user preferences file
    func removeTask(aTask: Task?) {
        if let currentTask = aTask {
            if let index = tasks.index(of: currentTask) {
                tasks.remove(at: index)
                saveTask()
            }
        }
    }
    
    // This method updates a specific task. If it does not exists, then it will add it.
    func updateTask(aTask: Task?) {
        if let currentTask = aTask {
            if let index = tasks.index(of: currentTask) {
                tasks[index].name = currentTask.name
                tasks[index].notes = currentTask.notes
                tasks[index].completed = currentTask.completed
                saveTask()
            }
            else {
                addTask(aTask: currentTask)
            }
        }
    }
    
    // This method saves task to the user preferences file
    private func saveTask() {
        let defaults = UserDefaults.standard
        defaults.set(tasks, forKey: "tasks")
        defaults.synchronize()
    }
    
}

