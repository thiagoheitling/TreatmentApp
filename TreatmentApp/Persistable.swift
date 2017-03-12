//
//  Persistable.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-11.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import Foundation
import RealmSwift

public protocol Persistable {
    
    associatedtype ManagedObject: RealmSwift.Object
    
    init(managedObject: ManagedObject)
    
    func managedObject() -> ManagedObject
}
