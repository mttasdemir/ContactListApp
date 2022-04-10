//
//  ContactListApp.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 9.04.2022.
//

import SwiftUI

@main
struct ContactListApp: App {
    @StateObject var contacts: ContactModel = ContactModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContactView(contacts: contacts)
                    .navigationTitle("Contacts")
                    .navigationViewStyle(.stack)
            }
            
        }
    }
}
