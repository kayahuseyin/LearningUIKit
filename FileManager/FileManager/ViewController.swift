//
//  ViewController.swift
//  FileManager
//
//  Created by Hüseyin Kaya on 23.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
    }


    
    
    @IBAction func writeButtonTapped(_ sender: Any) {
        
        let message: String = textField.text!
        
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = directory.appendingPathComponent("myFile.text")
            
            do {
                try message.write(to: filePath, atomically: false, encoding: String.Encoding.utf8)
                
                textField.text = ""
            } catch {
                print(error)
            }
        }
        
    }
    
    @IBAction func readButtonTapped(_ sender: Any) {
        
        let message: String = textField.text!
        
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = directory.appendingPathComponent("myFile.text")
            
            do {
                textField.text = try String(contentsOf: filePath, encoding: String.Encoding.utf8)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = directory.appendingPathComponent("myFile.text")
            textField.text = ""
            do {
                try FileManager.default.removeItem(at: filePath)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
    @IBAction func savePhotoButtonTapped(_ sender: Any) {
        
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = directory.appendingPathComponent("fries.png")
            
            let photo = UIImage(named: "fries")
            
            do {
                try photo?.pngData()?.write(to: filePath)
                
                textField.text = ""
            } catch {
                print(error)
            }
        }
        
        
    }
    
    
    @IBAction func showPhotoButtonTapped(_ sender: Any) {
        
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = directory.appendingPathComponent("fries.png")
            
            self.imageView.image = UIImage(contentsOfFile: filePath.path)
        }
        
    }
    
    
    @IBAction func deletePhotoButtonTapped(_ sender: Any) {
        
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = directory.appendingPathComponent("fries.png")
            
            do {
                try FileManager.default.removeItem(at: filePath)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
    
}

