//
//  MainScreenViewController.swift
//  QuizProject
//
//  Created by Hüseyin Kaya on 13.11.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Sign-in", message: "Enter id and password", preferredStyle: .alert)
        
        alertController.addTextField { textfield in
            textfield.placeholder = "ID"
            textfield.keyboardType = .emailAddress
        }
        
        alertController.addTextField { textfield in
            textfield.placeholder = "Password"
            textfield.isSecureTextEntry = true
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .destructive) { action in
            print("Saved")
            
        }
        
        alertController.addAction(saveAction)
        self.present(alertController, animated: true)
        
    }
}
