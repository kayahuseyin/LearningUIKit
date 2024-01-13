//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Hüseyin Kaya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var navigationBar: UINavigationBar!
    
    @IBOutlet var progressBar: UIProgressView!
    
    
    var countries = [
        "🇹🇷" : "Türkiye", "🇺🇾" : "Uruguay", "🇵🇹" : "Portugal", "🇩🇪": "Germany", "🇯🇵": "Japan", "🇪🇸": "Spain", "🇨🇷": "Costa Rica", "🇸🇪": "Sweden", "🇫🇷": "France", "🇧🇷": "Brazil", "🇮🇳": "India", "🇩🇰": "Denmark", "🇧🇬": "Bulgaria",
        "🇭🇺": "Hungary", "🇲🇦": "Morocco", "🇪🇬": "Egypt", "🇬🇭": "Ghana", "🇮🇹": "Italy", "🇮🇸": "Iceland", "🇷🇺": "Russia", "🇲🇰": "Macodeonia", "🇯🇲": "Jamaica", "🇮🇪": "Ireland", "🇦🇷": "Argentina", "🇬🇳": "Guinea", "🇮🇩": "Indonesia", "🇵🇱": "Poland",
        "🇬🇪": "Georgia", "🇧🇪": "Belgium", "🏴󠁧󠁢󠁷󠁬󠁳󠁿": "Wales", "🇿🇼": "Zimbabwe", "🇸🇦": "Saudi Arabia", "🇶🇦": "Qatar", "🇦🇿": "Azerbaijan", "🇨🇭": "Switzerland", "🇳🇱": "Holland"
        ]
    var countryFlags = [String]()
    var correctAnswer = 0 // doğru cevabın 1 mi 2 mi 3 mü olduğunu tutacak
    var score = 0
    var totalTime = 30
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //In order to make the flags bigger, size increased to 120
        //Attributes inspectiordan style'ı default olması gerek
        button1.titleLabel?.font = .systemFont(ofSize: 120.0)
        button2.titleLabel?.font = .systemFont(ofSize: 120.0)
        button3.titleLabel?.font = .systemFont(ofSize: 120.0)
        
        //Eğer bayrağın etrafına çerçeve ekleyip rengini değiştirmek isteseydim.
        //button1.layer.borderWidth = 1
        //button1.layer.borderColor = UIColor.green.cgColor
       
        
        
    countryFlags = Array(countries.keys)
        
    askQuestion()
        progressBar.progress = 1.0
    }
    
    func askQuestion() {
        countryFlags.shuffle() // countries array'ini karıştırıyor
        button1.setTitle(countryFlags[0], for: .normal)
        button2.setTitle(countryFlags[1], for: .normal)
        button3.setTitle(countryFlags[2], for: .normal)
        
        correctAnswer = Int.random(in: 0...2) // doğru cevabımız bu olacak soruyu navigation bar'a da bu sayıyla koyacağız.
        navigationBar.topItem?.title = countries[countryFlags[correctAnswer]] // countryFlags[correctAnswer] kodu bayrağı getiriyor country[countryFlag] da ülke ismini çıktı aldırıyor.
        
        scoreLabel.text = "Score: \(score)"//updateUI'da olacak
    }

    
    @IBAction func btnSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        if countries[sender.currentTitle!] == countries[countryFlags[correctAnswer]] {
            sender.layer.backgroundColor = UIColor.green.cgColor
            score += 1
            askQuestion()
            
        } else {
            sender.layer.backgroundColor = UIColor.systemRed.cgColor
            score -= 1
            askQuestion()

        }
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false) // 2 salise sonra siliyor
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateUI() {
        // butonlar temizlenecek
        button1.backgroundColor = .clear
        button2.backgroundColor = .clear
        button3.backgroundColor = .clear
    }
 
    
    
    
    @objc func updateTime() {
        if totalTime >= 0 {
                    progressBar.progress = Float(totalTime) / 30.0
                    totalTime -= 1
                } else {
                print("time's up")
                }
    }
}

    
