//
//  ViewController.swift
//  Quizzler-Swift
//
//  Created by Eren Candan on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let quiz = [
        Question(question: "4 + 2 = 6", answer: "True"),
        Question(question: "3 + 5 > 9", answer: "False"),
        Question(question: "3 - 1 < 3", answer: "True"),
    ]
    var questionNumber = 0

    @IBOutlet var falseButton: UIButton!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quiz[questionNumber].question
    }

    @IBAction func answerQuestion(_ sender: UIButton) {
        let useAnswer = sender.currentTitle // Will return True or False
        let actualAnswer = quiz[questionNumber].answer // Will return actual answer so we can compare them

        if useAnswer == actualAnswer {
            print("Right")
        } else {
            print("Wrong")
        }
        questionNumber += 1
        updateQuestion()
    }

    func updateQuestion() {
        // We are controlling lenght of Array so if [questionNumber] is bigger then quiz capacity
        // Resetting it to 0 else if continue to ++
        if questionNumber >= quiz.capacity {
            questionNumber = 0
            questionLabel.text = quiz[questionNumber].question

        } else {
            questionLabel.text = quiz[questionNumber].question
        }
    }
}
