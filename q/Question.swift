//
//  Question.swift
//  tvquiz
//
//  Created by Max Bilbow on 19/10/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation


class Question {
    
//    var id: Int?
    
    var question: String
    
    var answers: [String]// = ["A", "B", "C - Starwars the Fantom Menace"]
    
    private var _correctAnswer: Int// = 2
    
    var correctAnswer: String {
        return answers[_correctAnswer]
    }
    
    init(question aQuestion: String, correct: Int, answers: [String] ) {//-> Question {
//        let q = Question()
        question = aQuestion
        _correctAnswer = correct >= answers.count ? answers.count - 1 : correct
        if correct >= answers.count {
            NSLog("WARNING! Correct answer as too large! \(correct) > \(answers.count)")
        }
        self.answers = answers
//        return q;
    }
    class func new(question aQuestion: String, correct: Int, answers: String ... ) -> Question {
        return Question(question: aQuestion, correct: correct, answers: answers)
    }
    
    static var testQuestions:[Question] = [
            Question.new(question: "Answer the Question",correct: 2,answers: "A", "B", "C - Starwars the Fantom Menace"),
        Question.new(question: "What is your name", correct: 2, answers: "Valary", "Helsinky", "not Jamborine"),
        Question.new(question: "How is fish spelt?", correct: 0, answers: "phyt", "flush", "not Jamborine"),
        Question.new(question: "Why is?", correct: 2, answers: "I dont know", "This is too deep", "Who cares?", "C - Starwars the Phantom Manace")
        
        ]
}

