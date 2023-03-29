//
//  ViewController.swift
//  Quizzler-Swift
//
//  Created by Eren Candan on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let quiz = [
        ["4 + 2 = 6", "True"],
        ["5 - 3 > 1", "True"],
        ["3 + 8 < 10 ", "False"],
    ]
    var questionNumber = 0

    @IBOutlet var falseButton: UIButton!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quiz[questionNumber][0]
    }

    @IBAction func answerQuestion(_ sender: UIButton) {
        let useAnswer = sender.currentTitle // Will return True or False
        let actualAnswer = quiz[questionNumber][1] // Will return actual answer so we can compare them

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
            questionLabel.text = quiz[questionNumber][0]

        } else {
            questionLabel.text = quiz[questionNumber][0]
        }
    }
}
