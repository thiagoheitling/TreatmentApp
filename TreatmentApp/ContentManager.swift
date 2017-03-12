//
//  ContentManager.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-10.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import Foundation
import RealmSwift

class ContentManager {
    
    static let sharedInstance = ContentManager()
    
    private let urlString = "http://159.203.62.239:3000/treatment.json"
    
    private init() {}   //This prevents others from using the default '()' initializer for this class.

    func fetchTreatments(completion: @escaping (_ treatments: [Treatment], _ error: NSError?) -> Void) {
        
        // Try to load treatments from local store, if data exists
        if let storedTreatments = fetchFromLocalStorage() {
            
            completion(storedTreatments, nil)
            return
        }
        
        // Otherwise, download from remote server
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                
                var treatments = [Treatment]()
                
                    for item in json {
                        
                        var treatmentName = "treatment"
                        var treatmentAmount = 0
                        var treatmentUnit = "unit"
                        
                        if let itemDictionary = item as? [String: AnyObject] {

                            if let name = itemDictionary["name"] as? String {
                                treatmentName = name
                            }
                            
                            if let amount = itemDictionary["amount"] as? Int {
                                treatmentAmount = amount
                            }
                            
                            if let unit = itemDictionary["unit"] as? String {
                                treatmentUnit = unit
                            }
                        }
                        
                        var foundTreatment = Treatment()
                        foundTreatment.name = treatmentName
                        foundTreatment.amount = treatmentAmount
                        foundTreatment.unit = treatmentUnit
                        
                        treatments.append(foundTreatment)
                    }
                
                completion(treatments, nil)
                
                self.saveItemsToLocalStorageInBackground(with: treatments)
            }
            catch {
                print("[CONTENT_MANAGER] JSON  error: \(error)")
            }
        }.resume()
    }
    
    func saveItemsToLocalStorageInBackground(with treatments: [Treatment]) {
        
        DispatchQueue(label: "background").async {
            
            autoreleasepool {
                
                for each in treatments {
                    
                    let treatmentObject = TreatmentObject()
                    treatmentObject.id = NSUUID().uuidString
                    treatmentObject.name = each.name
                    treatmentObject.amount = each.amount
                    treatmentObject.unit = each.unit
                    
                    do {
                        
                        let realm = try Realm()
                        try realm.write {
                            
                            realm.add(treatmentObject)
                            print("[CONTENT_MANAGER] treatmentObject saved to Realm in saveItemsToLocalStorageInBackground()")
                        }
                        
                    } catch let error as NSError {
                        
                        print("[CONTENT_MANAGER] error saving to Realm: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func fetchFromLocalStorage() -> [Treatment]? {
        
        do {
            
            let realm = try Realm()
            let treatmentsObjects = realm.objects(TreatmentObject.self)
            return treatmentsObjects.count > 0 ? fetchTreatmentsFromStoredItems(with: treatmentsObjects) : nil
        }
        catch let error as NSError {
            
            print("[CONTENT_MANAGER] error loading from Realm: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchTreatmentsFromStoredItems(with treatmentsObjects: Results<TreatmentObject>) -> [Treatment] {
        
        var treatments = [Treatment]()
        var treatment = Treatment()

        for treatmentObject in treatmentsObjects {
            
            treatment = Treatment(managedObject: treatmentObject)
            treatments.append(treatment)
            print("[CONTENT_MANAGER] treatment fetched in getTreatmentsFromStoredItems()")
        }
        
        return treatments
    }
}
