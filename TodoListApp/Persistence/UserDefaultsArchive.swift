
import Foundation

class UserDefaultsArchive {
    
    private var storeKey = "PeopleKey"
    
    init(_ storeKey: String) {
      self.storeKey = storeKey
    }
    
    private func archiveCollection(collection : [Any]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: collection as NSArray) as NSData    
    }
    
     func loadCollection() -> [Any]? {
        if let unarchivedObject = UserDefaults.standard.object(forKey: storeKey) as? Data {
            
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Any]
        }
        return nil
    }
    
     func saveCollection(collection : [Any]?) {
        let archivedObject = archiveCollection(collection: collection!)
        UserDefaults.standard.set(archivedObject, forKey: storeKey)
        UserDefaults.standard.synchronize()
    }
    
}
