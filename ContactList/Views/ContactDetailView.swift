//
//  ContactDetailView.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 17.04.2022.
//

import SwiftUI

struct ContactDetailView: View {
    @EnvironmentObject var contactModel: ContactModel
    @Binding var contact: Contact
    @State private var editting: Bool = false
    @State private var editedContact: Contact = Contact.empty()
    var body: some View {
        VStack {
            ContactViewHeader(contact: contact)
            Text(contact.fullname)
                .font(.title)
                .fontWeight(.semibold)
            if contact.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.large)
                    .padding([.bottom], 10)
            }
            Form {
                Section("Phone") {
                    Text(PhoneNumberFormatter.format(contact.phone))
                }
                Section("Age") {
                    if let birthdayComponent = contact.birthdayComponents {
                        HStack(spacing: 10) {
                            Text("\(birthdayComponent.year ?? 0)**y**").roundedBackground()
                            Text("\(birthdayComponent.month ?? 0)**m**").roundedBackground()
                            Text("\(birthdayComponent.weekOfMonth ?? 0)**w**").roundedBackground()
                            Text("\(birthdayComponent.day ?? 0)**d**").roundedBackground()
                        }
                    }
                }
            }
            .font(.title3)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button ("Edit") {
                    editedContact = contact
                    editting = true
                }
            }
        }
        .sheet(isPresented: $editting, onDismiss: updateContact) {
            NewContactView(newContact: $editedContact)
        }
    }
    
    func updateContact() {
        if editedContact.isValid {
            contactModel.update(contact, by: editedContact)
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: .constant(Contact.sampleContacts[0]))
            .environmentObject(ContactModel())
    }
}
