//
//  ResultViewController.swift
//  QuizProject
//
//  Created by Hüseyin Kaya on 13.11.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var feedbackLabel: UILabel!
    
    var totalScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        if totalScore! > 5{
            feedbackLabel.text = ("Well done You have \(totalScore!) correct answer!")
            resultImage.image = UIImage(named: "happy_face")
        } else {
            feedbackLabel.text = ("Try again! You have only \(totalScore!) correct answer")
            resultImage.image = UIImage(named: "sad_face")
        }
        
    }
    

   
    @IBAction func playAgainPressed(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true) // oyunu tekrar baslatiyor
        
    }
    
}
