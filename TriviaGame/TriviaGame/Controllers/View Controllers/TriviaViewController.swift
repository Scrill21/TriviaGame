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
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //MARK: - Properties
    
    
    //MARK: - Actions
    @IBAction func choiceButtonTapped(_ sender: UIButton) {
        
    }
    
    //MARK: - Functions
    
    
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}//end of class
