/*
 * Task.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Jan 3, 2018
 * Description:
 *              Class to describe and manage a single todo task
 *              Implements methods for Equatable, NSObject and NSCoding protocols
 *              Allows to compare 2 instances and save this custom object in Users Defaults
 * Version: 0.2
 */

import Foundation
import UIKit

class Task : NSObject, NSCoding {
    
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
    
    init(_ aTask:Task) {
        self.id = aTask.id
        self.name = aTask.name
        self.notes = aTask.notes
        self.completed = aTask.completed
    }
    
    // Implements Equatable Protocol, to be able to compare two task objects
    // It is not listed in the class declaration above, because NSObject includes Equatable protocol. It is redundant.
    static func ==(lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
        // Two tasks are the same if the name is the same. Case insensitive.
        //return lhs.name.caseInsensitiveCompare(rhs.name) == ComparisonResult.orderedSame
    }
    
    // Functions for NSCoding Protocol
    
    // Implements deserialization of Task objects
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeInteger(forKey: "id")
        name = (aDecoder.decodeObject(forKey: "name") as? String)!
        notes = (aDecoder.decodeObject(forKey: "notes") as? String)!
        completed = aDecoder.decodeBool(forKey: "completed")
    }
    
    // Implements serialization of Task objects for saving in User Defaults
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(notes, forKey: "notes")
        aCoder.encode(completed, forKey: "completed")
    }
    
}
