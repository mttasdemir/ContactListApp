//
//  Contact.swift
//  ContactList
//
//  Created by Mustafa *** on 9.04.2022.
//

import Foundation

struct Contact: Identifiable, Equatable, Codable {
    var id: UUID = UUID()
    var name: String
    var surname: String
    var phone: String = ""
    var birthday: Date?
    var isFavorite: Bool = false
    
    var fullname: String {
        name + " " + surname
    }
    
    var isValid: Bool {
        !(name.isEmpty || surname.isEmpty)
    }
    
    var birthdayDesc: String {
        guard let birthday = birthday else { return "Add birthday"}
        return DateFormatter.trDateFormatter.string(from: birthday)
    }
    
    var birthdayComponents: DateComponents? {
        guard let birthday = birthday else { return nil }
        return Calendar.current.dateComponents([.year, .month, .weekOfMonth, .day], from: birthday, to: Date.now)
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
    static func empty() -> Contact {
        Contact(name: "", surname: "")
    }
}
