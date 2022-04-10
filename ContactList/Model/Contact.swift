//
//  Contact.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 9.04.2022.
//

import Foundation

struct Contact: Identifiable {
    let id: UUID = UUID()
    var name: String
    var surname: String
    
    var fullname: String {
        name + " " + surname
    }
}

extension Contact {
    static var sampleContacts = [
        Contact(name: "Mustafa", surname: "Taşdemir"),
        Contact(name: "Güldeste", surname: "Taşdemir"),
        Contact(name: "Ayşe Billur", surname: "Taşdemir"),
        Contact(name: "Ali", surname: "Taşdemir"),
        Contact(name: "Buket", surname: "Taşdemir"),
        Contact(name: "Uğur", surname: "Taşdemir"),
    ]
}
