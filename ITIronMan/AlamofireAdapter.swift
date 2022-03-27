//
//  AlamofireAdapter.swift
//  ITIronMan
//
//  Created by 張宇軒 on 2022/3/27.
//

import Foundation
import Alamofire

class AlamofireAdapter {
    
    private lazy var session: Session = {
        return Session()
    }()
    
    func requestForString(_ urlConvertible: URLConvertible, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, completion: @escaping ((Result<String, Error>) -> Void)) {
        
        session.request(urlConvertible, method: method, parameters: parameters, headers: headers)
            .responseString { response in
                
                let result = response.result
                
                switch result {
                case .success(let string):
                    completion(.success(string))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func request(_ urlConvertible: URLConvertible, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, completion: @escaping ((Data?, HTTPURLResponse?, Error?) -> Void)) {
        
        session.request(urlConvertible, method: method, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<300)
            .response { afResponse in
                
                completion(afResponse.data, afResponse.response, afResponse.error)
            }
    }
}
