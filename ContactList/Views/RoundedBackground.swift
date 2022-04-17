//
//  RoundedBackground.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 17.04.2022.
//

import Foundation
import SwiftUI

struct RoundedBackground: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.lightGray)
            .cornerRadius(15)
    }
    
}

extension View {
    func roundedBackground() -> some View {
        self.modifier(RoundedBackground())
    }
}
