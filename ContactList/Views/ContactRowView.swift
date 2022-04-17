//
//  ContactRowView.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 10.04.2022.
//

import Foundation
import SwiftUI

struct ContactRowView: View {
    @EnvironmentObject var contacts: ContactModel
    var contact: Contact
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Text(contact.name)
                .fontWeight(.semibold)
            Text(contact.surname)
                .fontWeight(.light)
            Spacer()
            if contact.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.small)
                    .onTapGesture {
                        withAnimation {
                            contacts.setFavorite(contact)
                        }
                    }
            }
        }
        .font(.title3)
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                contacts.setFavorite(contact)
            } label: {
                Image(systemName: "star.fill")
                    .tint(contact.isFavorite ? .yellow : .white)
            }
        }
    }
}
