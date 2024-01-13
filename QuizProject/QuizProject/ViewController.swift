//
//  ViewController.swift
//  QuizProject
//
//  Created by Hüseyin Kaya on 9.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heartLabel: UILabel!
    @IBOutlet var questionTextView: UITextView!
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var questions: [Question] = []
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        questions = [
            Question(question: "Which one is not a mammal?", options: ["Dog", "Bird", "Whale"], correctAnswerIndex: 1),
            Question(question: "What is the largest organ in the human body?", options: ["Heart", "Lung", "Skin"], correctAnswerIndex: 2),
            Question(question: "Which planet is known as the 'Red Planet' in the Solar System?", options: ["Venus", "Mars", "Jupiter"], correctAnswerIndex: 1),
            Question(question: "What is the symbol for the element with 'Hg'?", options: ["Mercury", "Gold", "Hydrogen"], correctAnswerIndex: 0),
            Question(question: "What is the capital of Turkey?", options: ["Istanbul", "Ankara", "Izmir"], correctAnswerIndex: 1),
            Question(question: "Who wrote the play 'Romeo and Juliet'?", options: ["William Shakespeare", "Jane Austen", "Charles Dickens"], correctAnswerIndex: 0),
            Question(question: "Which color is not part of the rainbow?", options: ["Blue", "Pink", "Yellow"], correctAnswerIndex: 1),
            Question(question: "Who is considered the first computer programmer?", options: ["Ada Lovelace", "Marie Curie", "Amelia Earhart"], correctAnswerIndex: 0),
            Question(question: "Which language is the most spoken?", options: ["English", "Chinese", "Spanish"], correctAnswerIndex: 1),
            Question(question: "Which planet is also known as the 'Morning Star' or 'Evening Star'?", options: ["Venus", "Mars", "Jupiter"], correctAnswerIndex: 0),
            
        ]
        
        updateUI()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let upcomingData = sender as? Int {
            
            let nextVC = segue.destination as! ResultViewController
            
            nextVC.totalScore = upcomingData
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        // Tum butonlarin default tag degeri 0'dir bunu gidip duzelttim. Diger cozum ise butonlarin titlelarini kontrol ettirebilirdik
        let userChoice = sender.tag
        
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        
        if userChoice == questions[currentQuestionIndex].correctAnswerIndex {
           
                   // Doğru cevap durumunda butonun arkaplan rengini yeşil yap
                   sender.backgroundColor = UIColor.green
                   // dogru sayisi degiskeni olusturulacak burda += 1 yapilacak
                    score += 1
               } else {
                   // Yanlış cevap durumunda butonun arkaplan rengini kırmızı yap
                   sender.backgroundColor = UIColor.red
                   print("doru cevap",questions[currentQuestionIndex].correctAnswerIndex)
                   print("isaretlenen", userChoice)
               }
        
        // Birkaç saniye bekledikten sonra bir sonraki soruya geç
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            self.currentQuestionIndex += 1
            
            if self.currentQuestionIndex == self.questions.count{
                // SONUC EKRANI GETIRELECEK
                self.performSegue(withIdentifier: "toResultViewController", sender: score)
            } else {
                self.updateUI()
            }
            
            
        }
    }
    
    func updateUI() {
        // Reset button backgrounds to default
        button1.backgroundColor = UIColor.white
        button2.backgroundColor = UIColor.white
        button3.backgroundColor = UIColor.white
        
        
        let currentQuestion = questions[currentQuestionIndex]
        questionTextView.text = currentQuestion.question
        button1.setTitle(currentQuestion.options[0], for: .normal)
        button2.setTitle(currentQuestion.options[1], for: .normal)
        button3.setTitle(currentQuestion.options[2], for: .normal)
        
        // Enable buttons for the next question
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
    }
    
   
    
}

