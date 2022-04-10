//
//  ContactModel.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 9.04.2022.
//

import Foundation

class ContactModel: ObservableObject {
    @Published var contacts: Array<Contact> = Contact.sampleContacts
    
    var orderedContacts: Array<Contact> {
        contacts.sorted {
            $0.name < $1.name
        }
    }
    
}
