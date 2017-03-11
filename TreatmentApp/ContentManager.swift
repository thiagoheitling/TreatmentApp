//
//  ContentManager.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-10.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import Foundation

class ContentManager {
    
    static let sharedInstance = ContentManager()
    
    private let urlString = "http://159.203.62.239:3000/treatment.json"
    
    private init() {} //This prevents others from using the default '()' initializer for this class.

    func loadTreatments(completion: @escaping (_ treatments: [Treatment], _ error: NSError?) -> Void) {
        
        // TODO: Try to load from local data, if data exists
        
        
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
            }
            catch {
                print("JSON  error: \(error)")
            }
            
        }.resume()
    }
}
