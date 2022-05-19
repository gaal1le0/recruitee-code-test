//
//  Extensions.swift
//  Recruitee-code-test
//
//  Created by Emanuel Martínez on 19/5/22.
//

import Foundation

extension String {

        func replace(string:String, replacement:String) -> String {
                return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
            }

            func removeWhitespace() -> String {
                return self.replace(string: " ", replacement: "")
            }
}
