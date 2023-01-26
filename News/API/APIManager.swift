//
//  APIManager.swift
//  News
//
//  Created by Алексей Ревякин on 15.01.2023.
//

import Foundation

enum APIType {
    case getNews
    
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?q=sport&pageSize=5&apiKey=221d31899a9a432e8aa1990cb8ac7c25")!
    }
    
    var headers: [String: String] {
        switch self {
        default:
            return [:]
        }
    }

    var request: URLRequest {
        var request = URLRequest(url: baseURL)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        return request
    }
}

class APIManager {
    static let shared = APIManager()
    
    func getNews(completition: @escaping (NewsAPI) -> Void) {
        let request = APIType.getNews.request
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            if let data = data, let news = try? JSONDecoder().decode(NewsAPI.self, from: data) {
                completition(news)
            } else {
                print("NO")
            }
        }
        task.resume()
    }
}
