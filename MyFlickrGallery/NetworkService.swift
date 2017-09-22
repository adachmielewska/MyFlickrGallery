//
//  Service.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 22.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation
import SwiftyJSON

class NetworkService {
    
    private var serviceConfig: ServiceConfig
    private var session: URLSession
    
    required public init(serviceConfig: ServiceConfig) {
        self.serviceConfig = serviceConfig
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func execute(request: Request, onComplete: @escaping (Response) -> Void) {
        guard let urlRequest = try? prepareURLRequest(for: request) else { return }
        let task: URLSessionDataTask = session.dataTask(with: urlRequest) { (data, urlResponse, error) -> Void in
            if let data = data {
                let response = Response((urlResponse as? HTTPURLResponse, data, error), for: request)
                onComplete(response)
            }
        }
        task.resume()
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {
        let fullUrl  = "\(serviceConfig.baseUrl)/\(request.path)"
        var urlRequest = URLRequest(url: URL(string: fullUrl)!)
        let requestParams = prepareRequestParams(request: request, path: fullUrl, urlRequest: urlRequest)
        urlRequest.httpBody = requestParams.0
        urlRequest.url = requestParams.1
        urlRequest.httpMethod = request.method.rawValue
        
        return urlRequest
    }
    
    private func prepareRequestParams(request: Request, path: String, urlRequest: URLRequest) -> (Data?, URL?) {
        switch request.parameters {
        case .body(let params):
            if let params = params as? [String: String] {
                
                return (try? JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0)), nil)
            }
        case .url(let params):
            if let params = params as? [String: String], let url = prepareUrlParams(params: params, path: path, urlRequest: urlRequest) {
                return (nil, url)
            }
        }
        
        return (nil, nil)
    }
    
    private func prepareUrlParams(params: [String: Any], path: String, urlRequest: URLRequest) -> URL? {
        guard let params = params as? [String: String] else { return nil }
        let queryParams = params.map({ return URLQueryItem(name: $0.key, value: $0.value) })
        guard var components = URLComponents(string: path) else { return nil }
        components.queryItems = queryParams
        return components.url
    }
}
