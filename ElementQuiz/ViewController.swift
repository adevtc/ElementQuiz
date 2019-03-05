//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Jon on 1/1/19.
//  Copyright © 2019 addevtec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuiz()
        startQuiz()
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var goAgainButton: UIButton!
    
    @IBAction func gotoNextQuiz(_ sender: Any) {
        currentQuizIndex += 1
        if currentQuizIndex >= quizList.count {
            resetQuiz()
        } else {
            afterResetQuiz()
        }
        
        updateQuiz()
    }
    
    @IBAction func goAgainButtonClicked(_ sender: Any) {
        afterResetQuiz()
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = quizList[currentQuizIndex]
    }
    
    let quizList = ["Carbon", "Gold", "Chlorine", "Sodium", "Oxygen", "Nitrogen", "Neon"]
    
    var currentQuizIndex = 0
    
    func startQuiz() {
        mainStackView.isHidden = false
        goAgainButton.isHidden = true
    }
    
    func resetQuiz() {
        goAgainButton.isHidden = false
        goAgainButton.isEnabled = true
        currentQuizIndex = 0
        mainStackView.isHidden = true
    }
    
    func afterResetQuiz() {
        goAgainButton.isHidden = true
        goAgainButton.isEnabled = false
        mainStackView.isHidden = false
    }
    
    func updateQuiz() {
        answerLabel.text = "?"
        let quizName = quizList[currentQuizIndex]
        let image = UIImage(named: quizName)
        imageView.image = image
    }
}
