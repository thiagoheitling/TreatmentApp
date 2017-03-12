//
//  TreatmentObject.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-11.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import Foundation
import RealmSwift

final class TreatmentObject: Object {
    
    dynamic var id = ""
    dynamic var name = ""
    dynamic var amount = 0
    dynamic var unit = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
