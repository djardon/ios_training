//
//  ApiManager.swift
//  iOSClassCode
//
//  Created by David Jardon on 11/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import Alamofire


enum ServiceResult {
    case success(data: Any?)
    case failure(error: String?)
}

// Define new type closure for return data
typealias ServiceCompletion = (_ result: ServiceResult) -> ()


class ApiManager {
    // MARK: - SINGLETON implementation -
    // Object unique instance
    static let shared = ApiManager()
    
    // Initializer access level change now
    private init() {}
    
    // MARK: - Properties -
    private let url_users = "https://randomuser.me/api/"
    
    
    // MARK: - Service methods -
    // Get users limit for 'count' parameter
    func fetchUsers(count: Int, callback: @escaping ServiceCompletion) {
        // Create custom Alamofire request
        // url: https://randomuser.me/api/
        // method: GET, return elements
        // encoding: QueryString, because parameters go in url like "?results=1"
        // parameters: {"results": count}
        // responseDecodable for decode response Data to 'UsersDTO'
        Alamofire.request(url_users,
                          method: .get,
                          parameters: ["results":count],
                          encoding: URLEncoding.queryString).responseDecodable{ (response: DataResponse<UsersDTO>) in
            // Original url request
            print("Request: \(String(describing: response.request))")
            // http url response
            print("Response: \(String(describing: response.response))")
            // Response serialization result
            print("Result: \(response.result)")
            
            // Response data decoded
            // response.value is a type of UsersDTO
            if let users = response.value {
                // Notify to callback data success result
                // and send users data
                callback(ServiceResult.success(data: users))
            }
            else {
                // Notify to callback data error message
                // and send custom text
                callback(ServiceResult.failure(error: "Error with parse response data"))
            }
        }
    }
}

// Custom extension for DataRequest Alamofire
extension DataRequest {
    // Only needed for decode Data type
    fileprivate func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
    
    // Only needed for encode Data type
    fileprivate func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
    
    // Custom methods to decode data response to 'T' class
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try self.newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
}
