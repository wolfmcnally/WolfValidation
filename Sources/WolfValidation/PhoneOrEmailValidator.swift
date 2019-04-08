//
//  PhoneOrEmailValidator.swift
//  WolfValidation
//
//  Created by Wolf McNally on 1/20/18.
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
import WolfCore

open class PhoneOrEmailValidator: Validator {
    public override init(name: String = "PhoneOrEmail", isRequired: Bool = true) {
        super.init(name: name, isRequired: isRequired)
    }

    open override func editValidate(_ validation: StringValidation) -> String? {
        if let phoneValue = try? validation.containsOnlyValidPhoneCharacters().value {
            return phoneValue
        }
        if let emailValue = try? validation.containsOnlyValidEmailCharacters().value {
            return emailValue
        }
        return nil
    }

    open override func submitValidate(_ validation: StringValidation) throws -> String {
        if let phoneValue = try? validation.isPhone().value {
            return phoneValue
        }
        if let emailValue = try? validation.isEmail().value {
            return emailValue
        }
        throw ValidationError(message: "#{name} must be a phone or email." ¶ ["name": name], violation: "phoneOrEmail")
    }
}
