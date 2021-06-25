//
//  NetworkingError.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/24/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case noChildUser
    case noBearer
    case serverError(Error)
    case badDecode
    case unauthorized
    case noData
    case unexpectedStatusCode(Int)
    case badEncoding
    case noRepresentation
    case formattedJSONIncorrectly
    case missingRequiredElement
}
