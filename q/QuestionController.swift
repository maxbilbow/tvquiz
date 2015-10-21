//
//  QuestionController.swift
//  tvquiz
//
//  Created by Max Bilbow on 20/10/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation


protocol QuestionController {
    
//    var questions: [Question]? { get }
    
    var repository: QuestionRepository { get set }
    
    var totalQuestions: Int { get }
    
    var thisQuestion: Question? { get }
    
    func begin() -> Question?
    
    func nextQuestion() -> Question?
    
    func submitAnswer(answer: String?) -> Bool
    
}
