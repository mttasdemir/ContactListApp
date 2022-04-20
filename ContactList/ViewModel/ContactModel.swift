//
//  ContactModel.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 9.04.2022.
//

import Foundation

class ContactModel: ObservableObject {
    @Published var contacts: Array<Contact> = []
    
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
    
    private var fileUrl: URL?
    //xcrun simctl get_app_container booted tr.tasdemir.app.test.ContactList data
    private func getFileUrl() throws -> URL {
        guard fileUrl == nil else { return fileUrl! }
        let fileManager = FileManager.default
        let directoryUrl = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        fileUrl = directoryUrl.appendingPathComponent("ContactList.data")
        return fileUrl!
    }
    
    func load() async throws {
        if contacts.isEmpty {
            let file = try FileHandle(forReadingFrom: getFileUrl())
            let contacts = try JSONDecoder().decode(Array<Contact>.self, from: file.availableData)
            DispatchQueue.main.async {
                self.contacts = contacts
            }
        }
    }
    
    private func save() throws {
        let jsonData = try JSONEncoder().encode(contacts)
        try jsonData.write(to: getFileUrl())
    }
    
    func setFavorite(_ contact: Contact) {
        if let index = contacts.index(of: contact) {
            contacts[index].isFavorite.toggle()
        }
    }
    
    func addContact(_ contact: Contact) throws {
        contacts.insert(contact, at: 0)
        try save()
    }
    
    func deleteContact(_ contact: Contact) {
        if let index = contacts.index(of: contact) {
            contacts.remove(at: index)
            try? save()
        }
    }
    
    func index(of contact: Contact) -> Int {
        contacts.index(of: contact)!
    }
    
    func update(_ contact: Contact, by edittedContact: Contact) {
        var edittedContact = edittedContact
        if let index = contacts.index(of: contact) {
            contacts.remove(at: index)
            edittedContact.id = contact.id
            contacts.append(edittedContact)
        }
        try? save()
    }
}

