//
//  SubmissionsAPI.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import UIKit

enum HeaderNames: String {
    case authorization = "Authorization"
    case contentType = "Content-Type"
}

// Put in global file
enum NetworkingError: Error {
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

class SubmissionsAPI {
    
    private let baseURL = URL(string: "https://storysquad-api.herokuapp.com/")!
    
    var parentUser: Parent?
    var children: [Child]?
    var childUser: Child?
    
    //Include parent and child TOKENS to model
    var parentBearer: Bearer?
    var childBearer: Bearer?
    
    
    //MARK: - Queries the database for information for the given submission.
    //
    
    func submitPage(child: ChildSubmission, page: String, completion: @escaping(Result<Any, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        let registerURL = baseURL
            .appendingPathComponent("/submit/read/\(child.id)")
            
        var request = URLRequest(url: registerURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: HeaderNames.contentType.rawValue)
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        do {
            
            let pageRep = Page(url: page, submissionID: child.id, checksum: nil)
            request.httpBody = try JSONEncoder().encode(pageRep)
            
        } catch {
            NSLog("Error encoding todo: \(page), \(error)")
            completion(.failure(.badEncoding))
            return
        }
        print("Request: \(request)")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error getting response: \(error)")
                completion(.failure(.serverError(error)))
                return
            }
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 204 {
                    print("Good response")
                    completion(.success("Succesfully Submitted Page"))
                    return
                } else {
                    print("Bad response, code: \(response.statusCode)")
                    completion(.failure(.unexpectedStatusCode(response.statusCode)))
                    return
                }
            }
            guard data != nil else {
                completion(.failure(.noData))
                return
            }
            
            // Then decode the Page response here
        }.resume()
    }
    
    
    
    
}

