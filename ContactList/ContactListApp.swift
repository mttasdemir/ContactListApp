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
            TabView {
                ContactView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Contacts")
                    }
                FavoriteView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favorites")
                    }
            }
            .environmentObject(contacts)
        }
    }
}
