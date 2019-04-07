//
//  Validator.swift
//  WolfValidation
//
//  Created by Wolf McNally on 3/18/17.
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
import WolfConcurrency
import WolfNIO

open class Validator {
    public let name: String
    public let isRequired: Bool

    public init(name: String, isRequired: Bool = true) {
        self.name = name
        self.isRequired = isRequired
    }

    open func editValidate(_ validation: StringValidation) -> String? {
        return validation.value
    }

    open func submitValidate(_ validation: StringValidation) throws -> String {
        return validation.value
    }

    /// This is used to validate each change to the field as it is edited. It returns either the original string, a modified form of the original string, or `nil` if the changes are rejected. Typically this evaluates only whether the string (if not `nil`) only contains characters allowed in the final syntax.
    public func editValidate(_ value: String?) -> String? {
        return editValidate(StringValidation(value: value, name: name))
    }

    /// This is used to validate the entire string when it is validated as a whole. It either returns the original string, a modified form of the original string, or throws a `ValidationError` explaining how the string falied to validate.
    public func submitValidate(_ value: String?) throws -> String {
        return try submitValidate(StringValidation(value: value, name: name).required(isRequired))
    }

    /// This is use to validate the entire string asynchronously, typically via a remote API call. If the validation succeeds, the promise is kept. If the validation fails, the promise fails with a `ValidationError`. If some other error occurs, the promise fails with an `Error`.
    open func remoteValidate(_ value: String?) -> Future<Void>? {
        return nil
    }

    public var remoteValidationSuccessMessage: String?
}
