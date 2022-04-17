//
//  PhoneNumberFormatter.swift
//  PhoneNumberApp
//
//  Created by Mustafa Taşdemir on 14.04.2022.
//

import Foundation

struct PhoneNumberFormatter {
    enum State {
        case zero, p1, p2, p3, one, two, three, four, five, six, seven, finish
    }
    
    static func format(_ phoneNumber: String, at stateOf: State? = nil) -> String {
        let phoneNumber = String(phoneNumber.filter { $0.isNumber })
        guard !phoneNumber.isEmpty else { return phoneNumber }
        var state: State
        let strArr = Array(phoneNumber)
        var result: Array<Character> = []
        
        state = stateOf ?? (strArr[0] == "0" ? .zero : .one)
        
        for number in strArr {
            switch state {
            case .zero:
                result.append(number)
                result.append(" ")
                state = .p1
            case .p1:
                result.append("(")
                result.append(number)
                result.append(")")
                state = .p2
            case .p2:
                if let index = result.firstIndex(of: ")") {
                    result.insert(number, at: index)
                }
                state = .p3
            case .p3:
                if let index = result.firstIndex(of: ")") {
                    result.insert(number, at: index)
                    result.append(" ")
                }
                state = .one
            case .one:
                result.append(number)
                state = .two
            case .two:
                result.append(number)
                state = .three
            case .three:
                result.append(number)
                result.append(" ")
                state = .four
            case .four:
                result.append(number)
                state = .five
            case .five:
                result.append(number)
                result.append(" ")
                state = .six
            case .six:
                result.append(number)
                state = .seven
            case .seven:
                result.append(number)
                result.append(" ")
                state = .finish
            case .finish:
                if let _ = result.firstIndex(of: "(") {
                    return phoneNumber.trimmingCharacters(in: [" "])
                } else {
                    return format(phoneNumber, at: .p1)
                }
            }
        }
        
        return String(result).trimmingCharacters(in: [" "])
    }
}
