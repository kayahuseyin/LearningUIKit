//
//  Question.swift
//  QuizProject
//
//  Created by Hüseyin Kaya on 13.11.2023.
//

import Foundation

class Question {
    var question: String
    var options: [String]
    var correctAnswerIndex: Int
    
    init(question: String, options: [String], correctAnswerIndex: Int) {
        self.question = question
        self.options = options
        self.correctAnswerIndex = correctAnswerIndex
    }
}
