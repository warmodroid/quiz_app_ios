//
//  ViewController.swift
//  Trivia App
//
//  Created by Mohit Agrawal on 04/09/20.
//  Copyright © 2020 Mohit Agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var popupView: UIView!
    
    let question = [
        QuestionModel(quizType: .single_answer, question: "Who is the best cricketer in the world?", optionA: "Sachin Tendulkar", optionB: "Virat", optionC: "Adam Gilchirst", optionD: "Jacques Kallis"),
        QuestionModel(quizType: .multiple_anser, question: "What are the colors in the Indian national flag? Select all:", optionA: "White", optionB: "Yellow", optionC: "Orange", optionD: "Green")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///seting up views
        nextButton.makeRound()
        popupView.shadow()
        popupView.corderRadius(4.0)
    }

    @IBAction func didTapNextButton(_ sender: Any) {
        
        if (nameField.text ?? "").isEmpty {
            ///Cant go ahaed, Name is required
            popupView.shake()
        } else {
            ///Launch next  quiz screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
            vc.quizQuestions = question
            vc.answerModel = AnswerModel(playerName: nameField.text ?? "name", date: Date(), answers: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

