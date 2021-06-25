//
//  SubmissionAPI.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/24/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import UIKit

class SubmissionsAPI {
    
    private let baseURL = URL(string: "https://storysquad-api.herokuapp.com/")!
    
    var childUser: Child?
    var submission: Submission?
    var story: Story?
    
    func getStoryWithCohortID(completion: @escaping(Result<String, NetworkingError>) ->Void ) {
        guard let childUser = childUser else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "storysquad-api.herokuapp.com"
        urlComponents.path = "/story"
        urlComponents.queryItems = [
            URLQueryItem(name: "childId", value: String(childUser.cohortID))
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error getting response: \(error)")
                completion(.failure(.serverError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Good response")
                    completion(.success("Got Story"))
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
                let story = try JSONDecoder().decode(Story.self, from: data)
                print(story)
                self.story = story
            } catch {
                NSLog("Error decoding child story: \(error)")
                completion(.failure(.badDecode))
            }
        }.resume()
    }
    
    //MARK: - Queries the database for information for the given submission.
    func getChildSubmissionFromDataBase(completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childUser = childUser,
              let story = story else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "storysquad-api.herokuapp.com"
        urlComponents.path = "/submission"
        urlComponents.queryItems = [
            URLQueryItem(name: "childId", value: String(childUser.childID)),
            URLQueryItem(name: "storyId", value: String(story.id))
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethod.get.rawValue
        
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
                    completion(.success("Got submission"))
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
                let submission = try JSONDecoder().decode(Submission.self, from: data)
                print(submission)
                self.submission = submission
            } catch {
                NSLog("Error decoding child submission: \(error)")
                completion(.failure(.badDecode))
            }
        }.resume()
    }
    
    //MARK: - Attempts to upload pages for the submission with the given ID.
    func submitPages(pages: [UIImage], completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childUser = childUser else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        let registerURL = baseURL
            .appendingPathComponent("/submit/write/\(childUser.id)")
        
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: registerURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let httpBody = NSMutableData()
        
        for image in pages {
            if let imageData = image.jpegData(compressionQuality: 1) {
                httpBody.append(convertFileData(mimeType: "image/jpeg",
                                                fileData: imageData,
                                                using: boundary))
            }
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
                    completion(.success("Pages submitted"))
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
            } catch {
                NSLog("Error decoding page: \(error)")
                completion(.failure(.badDecode))
            }
            
        }.resume()
    }
    
    //MARK: - Attempts to upload a drawing for the submission with the given ID.
    func submitDrawing(draw: UIImage, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childUser = childUser else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        let registerURL = baseURL
            .appendingPathComponent("/submit/draw/\(childUser.id)")
        
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: registerURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
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
            } catch {
                NSLog("Error decoding image: \(error)")
                completion(.failure(.badDecode))
            }
            
        }.resume()
    }
    
    //MARK: - Attempts to get all data for every submission by a given child
    func getSubmissionsForChild(completion: @escaping(Result<[Submission], NetworkingError>) -> Void) {
        
        guard let childUser = childUser else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("/submissions/child/\(childUser.id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
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
                let submission = try JSONDecoder().decode([Submission].self, from: data)
                print(submission)
            } catch {
                NSLog("Error decoding submission: \(error)")
                completion(.failure(.badDecode))
            }
        }.resume()
    }
    
    //MARK: - Attempts to mark the submission with the given ID as 'read'
    func markSubmissionAsRead(completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childUser = childUser else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("/submit/read/\(childUser.id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        
        URLSession.shared.dataTask(with: request) { _, response, error in
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
    func resetSubmissionBoolTo(hasRead: Bool, HasDrawn: Bool, hasWritten: Bool, completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childUser = childUser,
              let submission = submission else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        let newSubmissionCopy = submission
        newSubmissionCopy.hasRead = hasRead
        newSubmissionCopy.hasDrawn = HasDrawn
        newSubmissionCopy.hasWritten = hasWritten
        
        let requestURL = baseURL
            .appendingPathComponent("/submit/update-all/\(childUser.id)")
        
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let httpBody = NSMutableData()
        
        //TODO: Work on appending Boolean values to form data
        httpBody.appendString("--\(boundary)--")
        
        request.httpBody = httpBody as Data
        
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
    func deleteDrawSubmission( completion: @escaping(Result<String, NetworkingError>) -> Void) {
        
        guard let childUser = childUser else {
            completion(Result.failure(NetworkingError.noChildUser))
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("/submission/write/\(childUser.id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.delete.rawValue
        
        URLSession.shared.dataTask(with: request) { _, response, error in
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

