//
//  UUIDValidator.swift
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
import WolfCore

open class UUIDValidator: Validator {
    public let isUppercase: Bool

    public init(name: String = "UUID", isRequired: Bool = true, isUppercase: Bool = true) {
        self.isUppercase = isUppercase
        super.init(name: name, isRequired: isRequired)
    }

    open override func editValidate(_ validation: StringValidation) -> String? {
        return try? validation.containsOnlyValidUUIDCharacters(isUppercase: isUppercase).value
    }

    open override func submitValidate(_ validation: StringValidation) throws -> String {
        return try validation.isUUID(isUppercase: isUppercase).value
    }
}

extension StringValidation {
    fileprivate func containsOnlyValidUUIDCharacters(isUppercase: Bool) throws -> StringValidation {
        guard !value.isEmpty else { return self }

        var validation = self
        if isUppercase {
            validation = uppercased()
        } else {
            validation = lowercased()
        }
        do {
            return try validation.pattern("^[0-9a-fA-f-]*$")
        } catch is ValidationError {
            throw ValidationError(message: "#{name} contains invalid characters." ¶ ["name": name], violation: "containsOnlyValidUUIDCharacters")
        }
    }

    fileprivate func isUUID(isUppercase: Bool) throws -> StringValidation {
        guard !value.isEmpty else { return self }

        var validation = self
        if isUppercase {
            validation = uppercased()
        } else {
            validation = lowercased()
        }
        guard UUID(uuidString: validation.value) != nil else {
            throw ValidationError(message: "#{name} must be UUID in 8-4-4-4-12 format." ¶ ["name": name], violation: "uuid")
        }
        return validation
    }
}
