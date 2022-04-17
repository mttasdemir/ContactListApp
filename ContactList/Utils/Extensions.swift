//
//  Extensions.swift
//  ContactList
//
//  Created by Mustafa Taşdemir on 10.04.2022.
//

import Foundation
import SwiftUI

extension Array where Element: Identifiable {
    func index(of element: Element) -> Self.Index? {
        return self.firstIndex(where: { $0.id == element.id })
    }
}

extension DateFormatter {
    static var trDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd MMMM yyyy"
        df.locale = Locale(identifier: "tr_TR")
        return df
    }()
}

extension Binding where Value == Date {
    init(_ value: Binding<Value?>) {
        self.init(get: { value.wrappedValue ?? Date() },
                  set: { value.wrappedValue = $0 }
                )
    }
}

extension Color {
    static var lightGray = Color.gray.opacity(0.4)
}
