//
//  ErrorManager.swift
//  Recruitee-code-test
//
//  Created by Emanuel Martínez on 19/5/22.
//

import Foundation

enum AppError: Error {

    case validation,
    invalidParam

    var displayText: String {
        switch self {
        case .validation:
            return "Validation error"
        case .invalidParam:
            return "Invalid param"
        }
    }

}
