//
//  FavoriteView.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 10.04.2022.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var contacts: ContactModel
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts.favorites) { contact in
                    ContactRowView(contact: contact)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(ContactModel())
    }
}
