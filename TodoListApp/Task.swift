/*
 * Task.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Dec 20, 2017
 * Description:
 *              Class to describe and manage a single todo task
 * Version: 0.1
 */

import Foundation
import UIKit

class Task : Equatable {
    var id:Int
    var name:String
    var notes:String
    var completed:Bool
    
    init(_ id:Int, _ name:String, _ notes:String, _ completed:Bool) {
        self.id = id
        self.name = name
        self.notes = notes
        self.completed = completed
    }
    
    init(_ name:String, _ notes:String, _ completed:Bool) {
        self.id = -1
        self.name = name
        self.notes = notes
        self.completed = completed
    }
    
    static func ==(lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
    
}
