//
//  TriviaViewController.swift
//  TriviaGame
//
//  Created by Joshua Hoyle on 5/19/21.
//

import UIKit

class TriviaViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    // Answers
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchViewData()
    }
    
    
    //MARK: - Properties
    /// Answers
    var correctAnswer: String = ""
    var fetchedAnswers: [String] = []
    /// Other View updates
    var category = "",
        difficulty = "",
        question = ""
    /// Numbers and stuff
    var score: Int = 0
    var questionsCount: Int = 0
    
    // Delegate stuff
    
    
    
    //MARK: - Actions
    @IBAction func choiceButtonTapped(_ sender: UIButton) {
        guard let 🐋 = sender.titleLabel?.text else { return }
        if 🐋 == correctAnswer {
            /// Correct
            sender.backgroundColor = UIColor.green
            score += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.backgroundColor = .none
            }
            shuffleQuestions()
        } else {
            /// Wrong
            sender.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.backgroundColor = .none
            }
            shuffleQuestions()
        }
    } // End of Function
    
    
    //MARK: - Functions
    func updateView() {
        // Update Basic
        categoryLabel.text = category
        difficultyLabel.text = difficulty
        questionLabel.text = question
        
        // Shuffle
        fetchedAnswers.shuffle()
        choice1.setTitle(fetchedAnswers[0], for: .normal)
        choice2.setTitle(fetchedAnswers[1], for: .normal)
        choice3.setTitle(fetchedAnswers[2], for: .normal)
        choice4.setTitle(fetchedAnswers[3], for: .normal)
    } // End of Function
    
    
    func fetchViewData() {
        TriviaController.fetchTriviaAmount { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // Answers
                    let correct = response[0].correct
                    self.correctAnswer = correct
                    self.fetchedAnswers = response[0].incorrect
                    self.fetchedAnswers.append(correct)
                    
                    // View updates
                    self.category = response[0].category
                    self.difficulty = response[0].difficulty
                    self.question = response[0].question
                    
                    self.updateView()
                    
                case .failure(let error):
                    print("Error in \(#function)\(#line) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    } // End of Function
    
    
    func shuffleQuestions() {
        // Check if it's been 10 questions
        if questionsCount + 1 < 10 {
            fetchViewData()
            questionsCount += 1
        } else {
            let resultsVC =  storyboard?.instantiateViewController(withIdentifier: "resultsVC") as! ResultsViewController
            self.present(resultsVC, animated:true, completion:nil)
            // Something here to pass in the data about what our score should be
            resetBoard()
        }
    } // End of Function

    
    func resetBoard() {
        // Fetch new data
        // Might need a delay here
        score = 0
        questionsCount = 0
        fetchViewData()
    }
    
}//end of class
