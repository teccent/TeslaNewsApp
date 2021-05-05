//
//  Articles.swift
//  TeslaNewsApp
//
//  Created by Теона Магай on 05.05.2021.
//

struct Articl: Decodable {
    let publishedAt: String?
    let author: String?
    let title: String?
    let description: String?
    
    init(articlesData: [String: Any]) {
        publishedAt = articlesData["publishedAt"] as? String
        author = articlesData["author"] as? String
        title = articlesData["title"] as? String
        description = articlesData["description"] as? String
    }
    
    static func getArticles(from data: Any) -> [Articl] {
        guard let articlesData = data as? [String: Any] else { return [] }
        guard let articles = articlesData["articles"] as? [[String: Any]] else { return [] }
        return articles.compactMap { Articl(articlesData: $0) }
    }
}

