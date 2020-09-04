//
//  FinishViewController.swift
//  Trivia App
//
//  Created by Mohit Agrawal on 04/09/20.
//  Copyright © 2020 Mohit Agrawal. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    @IBOutlet weak var historyLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func showHistoryTapped(_ sender: Any) {
        let manager = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        do {
            let quiz =  try manager.fetch(Quiz.fetchRequest()) as [Quiz]
            let name = quiz[0].playername! as String
            let question1 = quiz[0].questionOne! as String
            let question2 = quiz[0].questionTwo! as String
            let ans1 = quiz[0].answerOne! as String
            let ans2 = quiz[0].answerTwo! as String
            
            historyLabel.text = "Name: \(name) \n \(question1) \n \(ans1) \n \(question2) \n \(ans2) "
        } catch {
            
        }
    }
    @IBAction func backTaped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
