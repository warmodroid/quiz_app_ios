//
//  Quiz.swift
//  Trivia App
//
//  Created by Mohit Agrawal on 04/09/20.
//  Copyright © 2020 Mohit Agrawal. All rights reserved.
//

import Foundation

struct QuestionModel {
    let quizType: QUIZ_TYPE
    let question: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
}

struct AnswerModel {
    let playerName: String
    let date: Date
    var answers: [QuizAnswer]?
}

struct QuizAnswer {
    let question: String
    let answer: String
}
