//
//  datosClientes.swift
//  Simple CRUD
//
//  Created by Diego on 11/12/24.
//

import Foundation
import SwiftUI

struct datos : Identifiable, Codable {
    var id = UUID()
    var name: String
    var age: Int
    var membershipType: String
    var numberPhone: String
    var date: Date
    
    init(name: String, age: Int, membershipType: String, numberPhone: String, date: Date) {
        self.name = name
        self.age = age
        self.membershipType = membershipType
        self.numberPhone = numberPhone
        self.date = date
    }
}
