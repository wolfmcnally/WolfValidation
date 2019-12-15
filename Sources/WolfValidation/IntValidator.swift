//
//  IntValidator.swift
//  WolfValidation
//
//  Created by Wolf McNally on 11/3/17.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import WolfLocale
import WolfFoundation

open class IntValidator: Validator {
    public let validRange: CountableClosedRange<Int>
    private var allowsNegative: Bool {
        return validRange.lowerBound < 0 || validRange.upperBound < 0
    }

    public init(name: String = "Value", isRequired: Bool = true, validRange: CountableClosedRange<Int> = Int.min ... Int.max) {
        self.validRange = validRange
        super.init(name: name, isRequired: isRequired)
    }

    open override func editValidate(_ validation: StringValidation) -> String? {
        return try? validation.containsOnlyValidIntegerCharacters(allowsNegative: allowsNegative).value
    }

    open override func submitValidate(_ validation: StringValidation) throws -> String {
        return try validation.isInteger(in: validRange).value
    }
}

extension StringValidation {
    fileprivate func containsOnlyValidIntegerCharacters(allowsNegative: Bool) throws -> StringValidation {
        guard !value.isEmpty else { return self }

        do {
            if allowsNegative {
                return try pattern("^-?[0-9]*$")
            } else {
                return try pattern("^[0-9]*$")
            }
        } catch is ValidationError {
            throw ValidationError(message: "#{name} contains invalid characters." ¶ ["name": name], violation: "containsOnlyValidIntegerCharacters")
        }
    }

    fileprivate func isInteger(in range: CountableClosedRange<Int>) throws -> StringValidation {
        guard !value.isEmpty else { return self }

        guard let i = Int(value), range.contains(i) else {
            throw ValidationError(message: "#{name} must be an integer from #{low} to #{high}." ¶ ["name": name, "low": String(describing: range.lowerBound), "high": String(describing: range.upperBound)], violation: "integer")
        }
        return self
    }
}
