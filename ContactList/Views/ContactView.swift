//
//  ContactView.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 9.04.2022.
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject var contacts: ContactModel
    @State private var searchText: String = ""
    @State private var addNewContact: Bool = false
    @State private var newContact: Contact = Contact.empty()
    @State private var isDeleting: Bool = false
    @State private var activeContact: Contact = Contact.empty()
    
    @State private var didError: Bool = false
    @State private var errorMsg: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResult) { contact in
                    NavigationLink(destination: ContactDetailView(contact: $contacts.contacts[contacts.index(of: contact)])) {
                        ContactRowView(contact: contact)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            activeContact = contact
                            isDeleting = true
                        } label: {
                            Image(systemName: "minus.circle.fill")
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addNewContact = true
                    } label: { Image(systemName: "plus")  }
                }
            }
            .sheet(isPresented: $addNewContact, onDismiss: addContact ) {
                NewContactView(newContact: $newContact)
            }
        }
        .overlay(confirmDelete)
        .task {
            do {
                try await contacts.load()
            }
            catch(let error) {
                didError = true
                errorMsg = error.localizedDescription
            }
        }
        .alert("Error", isPresented: $didError) {
            Button("OK") {}
        } message: {
            Text("Couldn't load/save **Contact List** \n \(errorMsg)")
        }
    }
    
    var confirmDelete: some View {
        Group {
            if isDeleting {
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 100.0)
                            .cornerRadius(10)
                            .padding()
                        VStack(spacing: 10) {
                            Button(role: .destructive) {
                                contacts.deleteContact(activeContact)
                                isDeleting = false
                            } label: {
                                Text("Delete contact")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity)
                            }
                            Button(role: .cancel) {
                                isDeleting = false
                            } label: {
                                Text("Cancel")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .buttonStyle(.bordered)
                        .padding()
                    }
                }
            }
        }
    }
    
    var searchResult: [Contact] {
        if !searchText.isEmpty {
            return contacts.orderedContacts.filter { $0.name.contains(searchText) }
        }
        return contacts.orderedContacts
    }
    
    func addContact() {
        if newContact.isValid {
            do {
                try contacts.addContact(newContact)
            } catch {
                didError = true
                errorMsg = error.localizedDescription
            }
        }
        newContact = Contact.empty()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
            .environmentObject(ContactModel())
    }
}
