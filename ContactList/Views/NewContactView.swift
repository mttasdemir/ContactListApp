//
//  NewContactView.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 11.04.2022.
//

import SwiftUI

struct NewContactView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var newContact: Contact
    
    var body: some View {
        NavigationView {
            List {
                TextField("First Name", text: $newContact.name, prompt: Text("First name"))
                TextField("Last Name", text: $newContact.surname, prompt: Text("Last name"))
                Toggle("Favorite", isOn: $newContact.isFavorite)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        newContact = Contact.empty
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .disabled(!newContact.isValid)
                }
            }
        }
    }
    
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView(newContact: .constant(Contact(name: "", surname: "")))
    }
}
