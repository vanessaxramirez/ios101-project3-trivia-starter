//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Vanessa Ramirez on 3/14/25.
//

import UIKit

class TriviaViewController: UIViewController {
    // MARK: - Navigation
     @IBOutlet weak var questionTextLabel: UILabel!
     @IBOutlet weak var categoryLabel: UILabel!
     @IBOutlet weak var textMedia: UITextView!
    
        @IBOutlet weak var buttonA: UIButton!
        @IBOutlet weak var buttonB: UIButton!
        @IBOutlet weak var buttonC: UIButton!
        @IBOutlet weak var buttonD: UIButton!
        
        // MARK: - Properties
        var triviaQAs = TriviaQAs()
        var currentQuestionIndex = 0
        var correctAnswers = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            buttonA.layer.cornerRadius = 10
            buttonB.layer.cornerRadius = 10
            buttonC.layer.cornerRadius = 10
            buttonD.layer.cornerRadius = 10
            
            displayQuestion()
            
            // Connect answer buttons to the answerButtonTapped function
            buttonA.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
            buttonB.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
            buttonC.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
            buttonD.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        }
        
        // MARK: - Actions
        @IBAction func answerButtonTapped(_ sender: UIButton) {
            let currentQuestion = triviaQAs.questions[currentQuestionIndex]
            let selectedAnswerIndex = sender.tag // Assuming you set tag values for the buttons
            
            // Check if the selected answer index matches the index of the correct answer
            if selectedAnswerIndex == currentQuestion.correctAnswerIndex {
                correctAnswers += 1
            }
            
            // Move to the next question if available
            currentQuestionIndex += 1
            if currentQuestionIndex < triviaQAs.questions.count {
                // Display the next question
                displayQuestion()
            } else {
                // Show game over screen if all questions are answered
                showGameOverScreen()
            }
        }
        
        func displayQuestion() {
            let currentQuestion = triviaQAs.questions[currentQuestionIndex]
            
            // Update question text in textMedia UITextView
            textMedia.text = currentQuestion.text
            
            // Make the text bold programmatically
            let boldFont = UIFont.systemFont(ofSize: 35, weight: .bold)
            textMedia.font = boldFont // Uncomment this line if you want to override the font style set in Interface Builder
            // Update question number label
            questionTextLabel.text = "Question \(currentQuestionIndex + 1)/\(triviaQAs.questions.count)"
            
            // Update category label
            categoryLabel.text = currentQuestion.category
            
            // Update answer buttons
            let answerButtons = [buttonA, buttonB, buttonC, buttonD]
            for (index, button) in answerButtons.enumerated() {
                button?.setTitle(currentQuestion.answers[index], for: .normal)
                button?.tag = index // Set the tag value to match the index of the answer choice
            }
        }
        
        func showGameOverScreen() {
            let alert = UIAlertController(title: "Game Over", message: "You got \(correctAnswers) out of \(triviaQAs.questions.count) questions correct.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.restartGame()
            }))
            present(alert, animated: true, completion: nil)
        }
        
        func restartGame() {
            currentQuestionIndex = 0
            correctAnswers = 0
            displayQuestion()
        }
}
