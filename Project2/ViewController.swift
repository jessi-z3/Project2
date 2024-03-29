//
//  ViewController.swift
//  Project2
//
//  Created by Jessi Zimmerman on 1/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var buttonScore: UIBarButtonItem!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAnswered = 0
    var countriesAsked = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
        buttonScore = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        

    }
    @IBAction func showScore(_ sender: UIBarButtonItem){
        let scoreShown = UIAlertController(title: "Score:", message: "\(score)", preferredStyle: .alert)
        scoreShown.addAction(UIAlertAction(title: "Done", style: .default))
        present(scoreShown, animated: true)
    }
   
    func askQuestion(action: UIAlertAction! = nil){
        if (questionsAnswered == 10) {
            let finalAlert = UIAlertController(title: "Score: \(score)", message: "You have answered 10 questions.", preferredStyle: .alert)
            finalAlert.addAction(UIAlertAction(title: "Done", style: .default))
            present(finalAlert, animated: true)
            score = 0
            questionsAnswered = 0
            countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
            askQuestion()
        }else{
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            title = "\(countries[correctAnswer].uppercased())"
            countries.remove(at: correctAnswer)
        }

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            questionsAnswered += 1
        }else {
            title = "Wrong. You chose \(countries[sender.tag].uppercased())"
            score -= 1
            questionsAnswered += 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        
        
    }
    

}

