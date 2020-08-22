//
//  ViewController.swift
//  QuizGame
//
//  Created by Evan Chang on 8/22/20.
//  Copyright © 2020 Evan Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Questions: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    
    var quizData = QuizData()

    override func viewDidLoad() {
        super.viewDidLoad()


        Questions.text = quizData.getQuestionText()
        Score.text = "Score: \(quizData.getScore())"
        ProgressBar.progress = 0
    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        TrueButton.isEnabled = false
        FalseButton.isEnabled = false
        let SelectedAnswer = sender.currentTitle!
        let Correct = quizData.checkAnswer(SelectedAnswer)
        if Correct {
            Questions.text = "Correct!"
            sender.backgroundColor = UIColor.green
            ProgressBar.progress += quizData.getProgress()
            

        }
        else {
            Questions.text = quizData.getQuestionComment()
            ProgressBar.progress += quizData.getProgress()
            sender.backgroundColor = UIColor.red
        }
        Score.text = "Score: \(quizData.getScore())"
        quizData.nextQuestion()
        Timer.scheduledTimer(
        timeInterval: 4.0,
        target: self,
        selector: #selector(UpdateQuestion),
        userInfo: nil,
        repeats: false)
    }
    
       @objc func UpdateQuestion() {
        
        Questions.text = quizData.getQuestionText()
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
        
        TrueButton.isEnabled = true
        FalseButton.isEnabled = true
        if ProgressBar.progress == 1 {
            ProgressBar.progress = 0
        }
    }
}

