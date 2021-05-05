//
//  ApiManager.swift
//  TeslaNewsApp
//
//  Created by Теона Магай on 05.05.2021.
//

class ApiManager {

    let articles = "https://newsapi.org/v2/everything?q=tesla&from=2021-04-05&sortBy=publishedAt&apiKey=02b2fcc3a201455292e65a80639aa5dd"
    
    static let shared = ApiManager()
    
    private init() {}
}
