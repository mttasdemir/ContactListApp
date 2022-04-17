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
    @State private var showDatePicker: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                TextField("First Name", text: $newContact.name, prompt: Text("First name"))
                TextField("Last Name", text: $newContact.surname, prompt: Text("Last name"))
                Toggle("Favorite", isOn: $newContact.isFavorite)
                PhoneNumberView(phoneNumber: $newContact.phone)
                Text(newContact.birthdayDesc)
                    .onTapGesture {
                        showDatePicker.toggle()
                    }
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
        .overlay(datePicker)
    }
    
    var datePicker: some View {
        Group {
            if showDatePicker {
                VStack {
                    Spacer()
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.accentColor)
                            .frame(maxHeight: 250)
                        DatePicker("", selection: Binding($newContact.birthday), in: PartialRangeThrough(Date.now), displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "tr_TR"))
                            .datePickerStyle(.wheel)
                            .font(.title3)
                            .padding(.trailing, 50)
                    }
                }
                .padding()
            }
        }
    }
    //Binding<Date>(get: { newContact.birthday ?? Date.now }, set: { newContact.birthday = $0 })
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView(newContact: .constant(Contact(name: "", surname: "")))
    }
}
