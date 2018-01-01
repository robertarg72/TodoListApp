/*
 * UserDefaultsArchive.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Jan 3, 2018
 * Description:
 *              This class is a data access layer that allow us to save an array of custom
 *              objects, like a list of Tasks, to Users Default by serializing its elements
 * Version: 0.2
 */
import Foundation

class UserDefaultsArchive {
    
    private var storeKey = ""
    
    init(_ storeKey: String) {
      self.storeKey = storeKey
    }
    
    // Private function to serialize the array as NSData that can be saved in User Defaults
    private func archiveCollection(collection : [Any]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: collection as NSArray) as NSData    
    }
    
    // Allows to retrieve a collection of custom objects from User Defaults
    func loadCollection() -> [Any]? {
        if let unarchivedObject = UserDefaults.standard.object(forKey: storeKey) as? Data {
            
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Any]
        }
        return nil
    }
    
    // Allows to save a collection of custom objects to User Defaults
    func saveCollection(collection : [Any]?) {
        let archivedObject = archiveCollection(collection: collection!)
        UserDefaults.standard.set(archivedObject, forKey: storeKey)
        UserDefaults.standard.synchronize()
    }
    
}
