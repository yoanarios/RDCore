//
//  ErrorFactory.swift
//  RDCore
//
//  Created by Yoana Rios  on 2021-01-24.
//  Copyright © 2021 Yoana R. Rios Diaz. All rights reserved.
//

import Foundation

public struct ErrorFactory {

    public struct Error: Equatable {
        public let domain: String
        public let code: Int
        public let message: String

        public init(domain: String, code: Int, message: String) {
            self.domain = domain
            self.code = code
            self.message = message
        }

        public func error(with customMessage: String? = nil, underlyingError: NSError? = nil) -> NSError {
            var userInfo: [String: Any] = [NSLocalizedDescriptionKey: [self.message, customMessage].compactMap { $0 }.joined(separator: " : ")]
            if let underlyingError = underlyingError {
                userInfo[NSUnderlyingErrorKey] = underlyingError
            }

            return NSError(domain: domain, code: code, userInfo: userInfo)
        }
    }
}

extension ErrorFactory {
    // Log error codes by range
}
