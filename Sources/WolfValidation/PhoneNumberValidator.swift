//
//  PhoneNumberValidator.swift
//  WolfValidation
//
//  Created by Wolf McNally on 5/15/17.
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

import WolfLocale
import WolfFoundation

open class PhoneNumberValidator: Validator {
    public override init(name: String = "Phone Number", isRequired: Bool = true) {
        super.init(name: name, isRequired: isRequired)
    }

    open override func editValidate(_ validation: StringValidation) -> String? {
        return try? validation.containsOnlyValidPhoneNumberCharacters().value
    }

    open override func submitValidate(_ validation: StringValidation) throws -> String {
        return try validation.isPhoneNumber().value
    }
}

extension StringValidation {
    fileprivate func containsOnlyValidPhoneNumberCharacters() throws -> StringValidation {
        do {
            return try pattern("^[() +._0-9-]*$")
        } catch is ValidationError {
            throw ValidationError(message: "#{name} contains invalid characters." ¶ ["name": name], violation: "containsOnlyValidPhoneNumberCharacters")
        }
    }

    public func isPhoneNumber() throws -> StringValidation {
        guard matchesDataDetector(type: .phoneNumber) else {
            throw ValidationError(message: "#{name} must be a valid phone number." ¶ ["name": name], violation: "emailAddress")
        }
        return self
    }
}
