//
//  ContactModel.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 9.04.2022.
//

import Foundation

class ContactModel: ObservableObject {
    @Published var contacts: Array<Contact> = Contact.sampleContacts
    
    var favorites: Array<Contact> {
        contacts
            .filter({ $0.isFavorite })
            .sorted { $0.name < $1.name }
    }
    
    var orderedContacts: Array<Contact> {
        contacts.sorted {
            $0.name < $1.name
        }
    }
    
    // MARK: - intents
    
    func setFavorite(_ contact: Contact) {
        if let index = contacts.index(of: contact) {
            contacts[index].isFavorite.toggle()
        }
    }
    
    func addContact(_ contact: Contact) {
        contacts.insert(contact, at: 0)
    }
    
    func deleteContact(_ contact: Contact) {
        if let index = contacts.index(of: contact) {
            contacts.remove(at: index)
        }
    }
}

