//
//  TriviaController.swift
//  TriviaGame
//
//  Created by anthony byrd on 5/19/21.
//

import Foundation

class TriviaController {
    
    //MARK: - String Constants
    //https://opentdb.com/api.php
    static let baseURL = URL(string: "https://opentdb.com/api.php")
    static let categoryComponent = "category"
    static let difficultyComponent = "difficulty"
    static let questionComponent = "question"
    static let correctComponent = "correct"
    static let incorrectComponent = "incorrect"
    static let amountKey = "amount"
    static let amountKeyValue = "10"
    static let typeKey = "type"
    static let typeKeyValue = "multiple"
    
    //MARK: - Methods
    static func fetchTriviaAmount(completion: @escaping (Result<[Results], NetworkError>) -> Void) {
        guard let baseURL = baseURL else {return completion(.failure(.invalidURL))}
        
        //Creating components and queries
        var component = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let amountQuery = URLQueryItem(name: amountKey, value: amountKeyValue)
        let typeQuery = URLQueryItem(name: typeKey, value: typeKeyValue)
        component?.queryItems = [amountQuery, typeQuery]
        
        guard let finalURL = component?.url else {return completion(.failure(.invalidURL))}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("TRIVIA REPONSE CODE: \(response)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            do {
                let trivia = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let triviaArray = trivia.results
                return completion(.success(triviaArray))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
}//End of class
