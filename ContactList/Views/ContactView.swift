//
//  ContactView.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 9.04.2022.
//

import SwiftUI

struct ContactView: View {
    @ObservedObject var contacts: ContactModel
    @State private var searchText: String = ""
    var body: some View {
        List {
            ForEach(searchResult) { contact in
                HStack(alignment: .center, spacing: 6) {
                    Text(contact.name)
                        .fontWeight(.semibold)
                    Text(contact.surname)
                        .fontWeight(.light)
                }
                .font(.title3)
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResult: [Contact] {
        if !searchText.isEmpty {
            return contacts.orderedContacts.filter { $0.name.contains(searchText) }
        }
        return contacts.orderedContacts
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contacts: ContactModel())
    }
}
