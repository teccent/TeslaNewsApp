//
//  NetworkManager.swift
//  TeslaNewsApp
//
//  Created by Теона Магай on 05.05.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch(url: String, handler: @escaping (Result<Any, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON  { handler($0.result) }
    }
}
