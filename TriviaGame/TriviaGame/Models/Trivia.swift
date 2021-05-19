//
//  Triva.swift
//  TriviaGame
//
//  Created by anthony byrd on 5/19/21.
//

import UIKit

struct TopLevelObject: Codable {
let results: [Results]
}

struct Results: Codable {
    let category: String
    let difficulty: String
    let question: String
    let correct: String
    let incorrect: [String]
    
}//end of struct

enum CodingKeys: String, CodingKey {
    case correct = "correct_answer"
    case incorrect = "incorrect_answer"
}


