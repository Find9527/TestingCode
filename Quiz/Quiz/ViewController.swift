//
//  ViewController.swift
//  Quiz
//
//  Created by Orange on 2021/6/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let question:[String] = [
        "frome what is cognac made?",
        "what si 7+7",
        "what is the captal of Vermont?"
    ]
    
    let answer:[String] = [
        "14",
        "montpelier",
        "Grapges"
    ]
    
    var currentQuestionIndex: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = question[currentQuestionIndex]
    }
    
    @IBAction func showNextQuestion(sender:AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == question.count {
            currentQuestionIndex = 0
        }
        let que:String = question[currentQuestionIndex]
        questionLabel.text = que
        answerLabel.text = "???"
    }
    
    @IBAction func showanswer(sender:AnyObject) {
        let ans:String = answer[currentQuestionIndex]
        answerLabel.text = ans
        
    }


}

