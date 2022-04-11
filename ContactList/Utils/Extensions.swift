//
//  Extensions.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 10.04.2022.
//

import Foundation

extension Array where Element: Identifiable {
    func index(of element: Element) -> Self.Index? {
        return self.firstIndex(where: { $0.id == element.id })
    }
}
