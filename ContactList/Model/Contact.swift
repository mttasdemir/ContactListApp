//
//  Contact.swift
//  ContactList
//
//  Created by Mustafa *** on 9.04.2022.
//

import Foundation

struct Contact: Identifiable, Equatable {
    let id: UUID = UUID()
    var name: String
    var surname: String
    var isFavorite: Bool = false
    
    var fullname: String {
        name + " " + surname
    }
    
    var isValid: Bool {
        !(name.isEmpty || surname.isEmpty)
    }
    
    mutating func inValidate() {
        self.name = ""
        self.surname = ""
    }
    
}

extension Contact {
    static var sampleContacts = [
        Contact(name: "Mu***", surname: "***", isFavorite: true),
        Contact(name: "Gü***", surname: "***", isFavorite: true),
        Contact(name: "Ay*** Bi***", surname: "***", isFavorite: true),
        Contact(name: "Al***", surname: "***", isFavorite: true),
        Contact(name: "Bu***", surname: "***", isFavorite: true),
        Contact(name: "Uğ***", surname: "***"),
        Contact(name: "Se***", surname: "***"),
        Contact(name: "Mu***", surname: "***"),
        Contact(name: "Ay***", surname: "***"),
        Contact(name: "De***", surname: "***"),
        Contact(name: "Ha***", surname: "***"),
        Contact(name: "Al***", surname: "***"),
        Contact(name: "Uğ***", surname: "***"),
        Contact(name: "Sa***", surname: "***"),
        Contact(name: "Ay***", surname: "***"),
        Contact(name: "Se***", surname: "***"),
    ]
}

extension Contact {
    static var empty: Contact = Contact(name: "", surname: "")
}
