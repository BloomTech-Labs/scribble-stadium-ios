//
//  SubmissionsAPI.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import UIKit

// Put in global file
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
    func getChildSubmissionFromDataBase(child: ChildSubmission, completion: @escaping(Result<ChildSubmission, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "storysquad-api.herokuapp.com"
        urlComponents.path = "/submission"
        urlComponents.queryItems = [
            URLQueryItem(name: "childId", value: String(child.childId)),
            URLQueryItem(name: "storyId", value: String(child.storyId))
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        print("Request: \(request)")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error getting response: \(error)")
                completion(.failure(.serverError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Good response")
                    completion(.success(child))
                    return
                } else {
                    print("Bad response, code: \(response.statusCode)")
                    completion(.failure(.unexpectedStatusCode(response.statusCode)))
                    return
                }
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let json = jsonData as? [String: Any] {
                print(json)
            }
            
            do {
                let childSubmission = try JSONDecoder().decode(ChildSubmission.self, from: data)
                print(childSubmission)
                // TODO: Do something with decoded object
            } catch {
                NSLog("Error decoding child submission: \(error)")
                completion(.failure(.badDecode))
            }
        }.resume()
    }
    
    //MARK: - Attempts to upload pages for the submission with the given ID.
    func submitPage(child: ChildSubmission, page: UIImage, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        let registerURL = baseURL
            .appendingPathComponent("/submit/write/\(child.id)")
        
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: registerURL)
        request.httpMethod = HTTPMethod.post.rawValue
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        let httpBody = NSMutableData()
        if let imageData = page.jpegData(compressionQuality: 1) {
            httpBody.append(convertFileData(mimeType: "image/jpeg",
                                            fileData: imageData,
                                            using: boundary))
        }
        
        httpBody.appendString("--\(boundary)--")
        
        request.httpBody = httpBody as Data
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error getting response: \(error)")
                completion(.failure(.serverError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 204 {
                    print("Good response")
                    completion(.success("Page submitted"))
                    return
                } else {
                    print("Bad response, code: \(response.statusCode)")
                    completion(.failure(.unexpectedStatusCode(response.statusCode)))
                    return
                }
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let json = jsonData as? [String: Any] {
                print(json)
            }
            
            do {
                let page = try JSONDecoder().decode(Page.self, from: data)
                print(page)
                // TODO: Do something with decoded object
            } catch {
                NSLog("Error decoding page: \(error)")
                completion(.failure(.badDecode))
            }
            
        }.resume()
    }
    
    //MARK: - Attempts to upload a drawing for the submission with the given ID.
    func submitDrawing(child: ChildSubmission, draw: UIImage, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        let registerURL = baseURL
            .appendingPathComponent("/submit/draw/\(child.id)")
        
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: registerURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        let httpBody = NSMutableData()
        if let imageData = draw.jpegData(compressionQuality: 1) {
            httpBody.append(convertFileData(mimeType: "image/jpeg",
                                            fileData: imageData,
                                            using: boundary))
        }
        
        httpBody.appendString("--\(boundary)--")
        
        request.httpBody = httpBody as Data
        
        print(String(data: httpBody as Data, encoding: .utf8)!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error getting response: \(error)")
                completion(.failure(.serverError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 201 {
                    print("Good response")
                    completion(.success("Image submitted"))
                    return
                } else {
                    print("Bad response, code: \(response.statusCode)")
                    completion(.failure(.unexpectedStatusCode(response.statusCode)))
                    return
                }
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let json = jsonData as? [String: Any] {
                print(json)
            }
            
            do {
                let image = try JSONDecoder().decode(Image.self, from: data)
                print(image)
                // TODO: Do something with decoded object
            } catch {
                NSLog("Error decoding image: \(error)")
                completion(.failure(.badDecode))
            }
            
        }.resume()
    }
    
    //MARK: - Attempts to get all data for every submission by a given child
    func getSubmissionsForChild(child: ChildSubmission, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("/submissions/child/\(child.id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            if let error = error {
                NSLog("Error getting submissions with: \(error)")
                completion(.failure(.missingRequiredElement))
                return
            }
            
            guard let data = data else {
                NSLog("No data returned")
                completion(.failure(.noData))
                return
            }
            
            do {
                let submission = try JSONDecoder().decode(Submission.self, from: data)
                print(submission)
            } catch {
                NSLog("Error decoding submission: \(error)")
                completion(.failure(.badDecode))
            }
        }.resume()
    }
    
    //MARK: - Attempts to mark the submission with the given ID as 'read'
    func markSubmissionAsRead(child: ChildSubmission, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("/submit/read/\(child.id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        URLSession.shared.dataTask(with: requestURL) { _, response, error in
            if let error = error {
                NSLog("Error getting submissions with: \(error)")
                completion(.failure(.missingRequiredElement))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 204 {
                    print("Good response")
                    completion(.success("Toggled hasRead"))
                    return
                } else {
                    print("Bad response, code: \(response.statusCode)")
                    completion(.failure(.unexpectedStatusCode(response.statusCode)))
                    return
                }
            }
        }.resume()
    }
    
    //MARK: - Attempts to mark the submission with the given ID as hasRead as 'false', hasWritten as 'false', hasDrawn as 'false'
    func resetSubmissionBool(child: ChildSubmission, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("/submit/update-all/\(child.id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        URLSession.shared.dataTask(with: requestURL) { _, response, error in
            if let error = error {
                NSLog("Error getting submissions with: \(error)")
                completion(.failure(.missingRequiredElement))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 204 {
                    print("Good response")
                    completion(.success("Reset successful"))
                    return
                } else {
                    print("Bad response, code: \(response.statusCode)")
                    completion(.failure(.unexpectedStatusCode(response.statusCode)))
                    return
                }
            }
        }.resume()
    }
    
    //MARK: - Attempts to delete the drawn submission with the specified submission ID.
    func deleteDrawSubmission(child: ChildSubmission, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childBearer = childBearer else {
            completion(Result.failure(NetworkingError.noBearer))
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("/submission/write/\(child.id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.delete.rawValue
        request.setValue("\(childBearer.token)", forHTTPHeaderField: HeaderNames.authorization.rawValue)
        
        URLSession.shared.dataTask(with: requestURL) { _, response, error in
            if let error = error {
                NSLog("Error getting submissions with: \(error)")
                completion(.failure(.missingRequiredElement))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 204 {
                    print("Good response")
                    completion(.success("Reset successful"))
                    return
                } else {
                    print("Bad response, code: \(response.statusCode)")
                    completion(.failure(.unexpectedStatusCode(response.statusCode)))
                    return
                }
            }
        }.resume()
    }
    
    private func convertFormField(named name: String, value: String, using boundary: String) -> String {
        var fieldString = "--\(boundary)\r\n"
        fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
        fieldString += "\r\n"
        fieldString += "\(value)\r\n"
        
        return fieldString
    }
    
    private func convertFileData(mimeType: String, fileData: Data, using boundary: String) -> Data {
        let data = NSMutableData()
        
        data.appendString("--\(boundary)\r\n")
        data.appendString("Content-Disposition: form-data\r\n")
        data.appendString("Content-Type: \(mimeType)\r\n\r\n")
        data.append(fileData)
        data.appendString("\r\n")
        
        return data as Data
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}

