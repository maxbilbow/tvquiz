//
//  QuestionRepository.swift
//  tvquiz
//
//  Created by Max Bilbow on 19/10/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation

protocol QuestionRepository {
        
    func loadQuestions(fromSource source: AnyObject?) -> [Question]?
    
}

