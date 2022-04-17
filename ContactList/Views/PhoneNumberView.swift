//
//  PhoneNumberView.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 15.04.2022.
//

import SwiftUI

struct PhoneNumberView: View {
    @Binding var phoneNumber: String
    var body: some View {
        HStack {
            TextField("Phone Number", text: $phoneNumber, prompt: Text("Phone number"))
                .onChange(of: phoneNumber) { [phoneNumber] phone in
                    if phone + ")" == phoneNumber {
                        self.phoneNumber = PhoneNumberFormatter.format(String(phone.prefix(phone.count-1)))
                    } else {
                        self.phoneNumber = PhoneNumberFormatter.format(phone)
                    }
                }
            if !phoneNumber.isEmpty {
                Image(systemName: "multiply.circle.fill")
                    .imageScale(.small)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        phoneNumber = ""
                    }
            }
        }
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(phoneNumber: .constant("1234567"))
    }
}
