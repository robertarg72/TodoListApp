/*
 * TasksList.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Jan 3, 2018
 * Description: 
 *              Class to describe and manage todo tasks, as a collections of tasks
 *              The list of tasks is stored in User Prefences Storage by using the
 *              UsersDefaultsArchive class. 
 * Version: 0.2
 */

import Foundation
import UIKit

class TasksList {
    static let sharedTasksList = TasksList()
    private(set) var tasks:[Task]
    private var persistence: UserDefaultsArchive
    
    init(){
        //let defaults = UserDefaults.standard
        //let storedTasks = defaults.object(forKey: "tasks") as? [Task]
        //tasks = storedTasks != nil ? storedTasks! : []
        
        persistence = UserDefaultsArchive(Constants.Text.UserDefaultsStorageKey)
        let storedTasks = persistence.loadCollection() as? [Task]
        tasks = storedTasks != nil ? storedTasks! : []
        
        if tasks.count == 0 {
            tasks = self.createTestData()
        }
    }
    
    // This method adds a new task to the user preferences file
    func addTask(aTask: Task?) {
        
        if let currentTask = aTask {
            if !tasks.contains(currentTask) {
                //currentTask.id = tasks.endIndex
                //tasks.append(currentTask)
                
                // Append task at the beggining of the array
                tasks.insert(currentTask, at: 0)
                currentTask.id = 0
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
//        let defaults = UserDefaults.standard
//        defaults.set(tasks, forKey: "tasks")
//        defaults.synchronize()
        
        persistence.saveCollection(collection: tasks)
    }
    
    // This  method generates test data to show in the app
    private func createTestData() -> [Task]{
        let names = [
            "iOS Assignment 2 Design",
            "Enterprise Milestone 2",
            "Android Assignment 3",
            "Web Technologies M1",
            "UI/UX M2 Design prototype",
            "iOS Assignment 2 Design",
            "Enterprise Milestone 2",
            "Android Assignment 3",
            "Web Technologies M1",
            "UI/UX M2 Design prototype"
        ]
        
        let descriptions = [
        "iOS Assignment 2 Design, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "Enterprise Milestone 2, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "Android Assignment 3, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "Web Technologies M1, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "UI/UX M2 Design prototype, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "iOS Assignment 2 Design, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "Enterprise Milestone 2, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "Android Assignment 3, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "Web Technologies M1, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        "UI/UX M2 Design prototype, we need to create a Xcode project and implement designed screens as well as basic navigation.",
        ]
        
        var completed = true
        
        var tasks = [Task]()
        
        for i in 0 ..< names.count {
            completed = !completed
            let task = Task(i, names[i], descriptions[i], completed)
            tasks.append(task)
        }
        return tasks
    }
    
}

