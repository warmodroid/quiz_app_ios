//
//  QuizViewController.swift
//  Trivia App
//
//  Created by Mohit Agrawal on 04/09/20.
//  Copyright © 2020 Mohit Agrawal. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var quizOptionView: QuizOptionsView!
    
    var quizQuestions: [QuestionModel]?
    var numberOfQuestions: Int?
    var currentQuestion = 1
    var answerModel: AnswerModel?
    var selectedAnwser: [QuizAnswer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfQuestions = quizQuestions?.count

        questionLabel.text = quizQuestions![currentQuestion-1].question
        quizOptionView.questions = quizQuestions![currentQuestion-1]

        popupView.shadow()
        popupView.corderRadius(4.0)
        quizOptionView.corderRadius(4.0)
        nextButton.makeRound()
    }
    

    @IBAction func didTapNextButton(_ sender: Any) {
        
        ///Saving the quiz answer before displaying the next quiz
        if !quizOptionView.getSelectedAnswer().answer.isEmpty && selectedAnwser.count < numberOfQuestions! {
            selectedAnwser.append(quizOptionView.getSelectedAnswer())
            answerModel?.answers = selectedAnwser
            
            //saveData()
        }
        
        if currentQuestion < numberOfQuestions! {
            currentQuestion += 1
            questionLabel.text = quizQuestions![currentQuestion-1].question
            quizOptionView.questions = quizQuestions![currentQuestion-1]
        } else {
            //Go to homepage
            saveData()
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if currentQuestion == numberOfQuestions {
            nextButton.setTitle("Finsih", for: .normal)
        }
    }
    
    ///save data to core data
    func saveData() {
        let manager = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let quiz = Quiz(context: manager)
        quiz.playername = answerModel?.playerName
        quiz.questionOne = answerModel?.answers![0].question
        quiz.questionTwo = answerModel?.answers![1].question
        quiz.answerOne = answerModel?.answers![0].answer
        quiz.answerTwo = answerModel?.answers![1].answer
        
        try! manager.save()
    }
}
