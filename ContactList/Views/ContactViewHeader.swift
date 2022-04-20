//
//  ContactViewHeader.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 20.04.2022.
//

import SwiftUI

struct ContactViewHeader: View {
    let contact: Contact
    
    var body: some View {
        VStack {
            if let firstLetters = contact.firstLetters {
                GeometryReader { proxy in
                    Circle()
                        .foregroundColor(.gray)
                        .overlay(alignment: .center) {
                            Text(firstLetters.uppercased())
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .font(.system(size: min(proxy.size.width/2, proxy.size.height/2)))
                        }
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
        }
        .frame(maxHeight: 100)
    }
}

struct ContactViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ContactViewHeader(contact: Contact.sampleContacts[0])
    }
}
