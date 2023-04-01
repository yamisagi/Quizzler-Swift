//
//  ViewController.swift
//  Quizzler-Swift
//
//  Created by Eren Candan on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var quizSource = QuizSource()
  

    @IBOutlet var falseButton: UIButton!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuestion()
    }

    @IBAction func answerQuestion(_ sender: UIButton) {
        let userAnswer = sender.currentTitle ?? "True" // Will return True or False
       
        var answer = quizSource.checkAnswer(userAnswer)
        
        if answer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
       
        quizSource.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }

    @objc func updateQuestion() {
        // We are controlling lenght of Array so if [questionNumber] is bigger then quiz capacity
        // Resetting it to 0 else if continue to ++

        questionLabel.text = quizSource.getQuestion()
        progressBar.progress = quizSource.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}
