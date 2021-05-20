//
//  ResultsViewController.swift
//  TriviaGame
//
//  Created by Joshua Hoyle on 5/19/21.
//

import UIKit

// MARK: - Protocols
protocol ScoreDelegate: AnyObject {
    func fetchScore(score: Int)
}


class ResultsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreMessageLabel: UILabel!
    
    
    // MARK: - Properties
    var fetchedScore = 0/*This should be grabbed from the TrivialViewController before it resets"?"*/
    
    weak var delegate: ScoreDelegate?
    func fetchScore() {
        delegate?.fetchScore(score: 0)
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(score: fetchedScore)
    }
    
    
    // MARK: - Functions
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    } // End of Function
    
    
    func updateView(score: Int) {
        let 🐐 = score
        updateScore(score: 🐐)
        updateMessage(score: 🐐)
    } // End of Function
    
    
    func updateScore(score: Int) {
        let 🐉 = score
        scoreLabel.text = "\(🐉)"
    } // End of Function
    
    
    func updateMessage(score: Int) {
        let 🐍 = score
        switch 🐍 {
        case 0:
            scoreMessageLabel.text = "If you were randomly guessing, you would have gotten more right!"
        case 1...3:
            scoreMessageLabel.text = "TODO"
        case 4...6:
            scoreMessageLabel.text = "TODO"
        case 7...9:
            scoreMessageLabel.text = "TODO"
        case 10:
            scoreMessageLabel.text = "Perfect! You got all of the questions right!"
        default:
            scoreMessageLabel.text = "How did you get a score of \(🐍)?! That shouldn't have happened"
        }
    } // End of Function
    
} // End of Class
