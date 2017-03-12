//
//  Treatment.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-10.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import Foundation

struct Treatment {
    
    var id = "no data"
    var name = "no data"
    var amount = 0
    var unit = "no data"
}

extension Treatment: Persistable {
    
    // MARK: Persistable protocol
    public init(managedObject: TreatmentObject) {
        
        id = managedObject.id
        name = managedObject.name
        amount = managedObject.amount
        unit = managedObject.unit
    }
    
    public func managedObject() -> TreatmentObject {
        
        let treatment = TreatmentObject()
        treatment.id = id
        treatment.name = name
        treatment.amount = amount
        treatment.unit = unit
        
        return treatment
    }
}
