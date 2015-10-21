//
//  QuestionController.swift
//  tvquiz
//
//  Created by Max Bilbow on 20/10/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation


class QuestionControllerImpl : QuestionController {
    
    var repository: QuestionRepository
    
    var questions: [Question]?
    
    
    var thisQuestion: Question? {
        return count < questions?.count ? questions?[count] : nil
    }
    
    private var count: Int = 0
    
    var totalQuestions: Int {
        return questions?.count ?? 0
    }
    
    private init(){
        repository = QuestionRepositoryImpl.new()
    }
    
    func submitAnswer(answer: String?) -> Bool {
        return thisQuestion?.correctAnswer == answer
    }
    
    func begin() -> Question? {
        questions = repository.loadQuestions(fromSource: nil)
        count = 0
        return questions?.first
    }
    
    func nextQuestion() -> Question? {
        return ++count < questions?.count ? questions?[count] : nil
    }
    
    
    
    class func new() -> QuestionController {
        return QuestionControllerImpl()
    }
}