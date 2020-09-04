//
//  QuizOptionsView.swift
//  Trivia App
//
//  Created by Mohit Agrawal on 04/09/20.
//  Copyright © 2020 Mohit Agrawal. All rights reserved.
//

import UIKit

class QuizOptionsView: UIView {
    
    @IBOutlet weak var optionASwitch: UISwitch!
    @IBOutlet weak var optionBSwitch: UISwitch!
    @IBOutlet weak var optionCSwitch: UISwitch!
    @IBOutlet weak var optionDSwitch: UISwitch!
    
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var labelD: UILabel!
    
    
    var questions: QuestionModel? {
        didSet {
            setQuestion()
        }
    }
    
    ///By default, assuming that Quiz is single answer type
    private var quizType: QUIZ_TYPE = .single_answer
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        //contentView = view
    }
    
    private func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: "QuizOptionsView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    ///When user is selecting the switch
    @IBAction func didTapOption(_ sender: UISwitch) {
        if quizType == .single_answer {
            switchON(only: sender.tag)
        }
    }
    
    /**
     It will help to help to switch on only one switch in case of single answer type quiz
     */
    private func switchON(only swtch: Int) {
        
        optionASwitch.isOn = false
        optionBSwitch.isOn = false
        optionCSwitch.isOn = false
        optionDSwitch.isOn = false
        
        switch swtch {
        case 1:
            optionASwitch.isOn = true
        case 2:
            optionBSwitch.isOn = true
        case 3:
            optionCSwitch.isOn = true
        case 4:
            optionDSwitch.isOn = true
        default:
            return
        }
    }
    
    ///Setting the the question labels
    private func setQuestion() {
        quizType = questions!.quizType
        labelA.text = questions?.optionA
        labelB.text = questions?.optionB
        labelC.text = questions?.optionC
        labelD.text = questions?.optionD
        optionASwitch.isOn = false
        optionBSwitch.isOn = false
        optionCSwitch.isOn = false
        optionDSwitch.isOn = false
    }
    
    //Return the selected answer to the controller
    func getSelectedAnswer() -> QuizAnswer {
        
        var answer = ""
        
        if optionASwitch.isOn {
            answer = answer + questions!.optionA + ","
        }
        if optionBSwitch.isOn {
            answer = answer + questions!.optionB + ","
        }
        if optionCSwitch.isOn {
            answer = answer + questions!.optionC + ","
        }
        if optionDSwitch.isOn {
            answer = answer + questions!.optionD + ","
        }
        
        return QuizAnswer(question: questions?.question ?? "question", answer: answer)
    }
}
