//
//  File.swift
//  tvquiz
//
//  Created by Max Bilbow on 19/10/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation

class QuestionRepositoryImpl : QuestionRepository {
    
    
    
    private init(){
    }
    
    
    func loadQuestions(fromSource source: AnyObject?) -> [Question]? {
        guard let source = source as? [Question] else {
            return Question.testQuestions
        }
        return source
    }
    
    class func new() -> QuestionRepository {
        return QuestionRepositoryImpl()
    }
    
}