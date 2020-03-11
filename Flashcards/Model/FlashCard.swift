//
//  Question.swift
//  Flashcards
//
//  Created by Jawny J on 2/29/20.
//  Copyright © 2020 Jawny Jules. All rights reserved.
//

/*
 TODO
 - Implement Question Delegate for Multichoice
 
 */

import Foundation

protocol  FlashCardDelegate {
    func  updateCard()
    
}

struct FlashCard {
    
    var Question: String
    var Answer1: String
    var Answer2: String?
    var Answer3: String?
    var Answer4: String?

    var delegate: FlashCardDelegate?
    
  init(question: String, answer1:String, answer2: String?, answer3: String?, answer4: String?){
             self.Question = question
             self.Answer1 = answer1
             self.Answer2 = answer2
             self.Answer3 = answer3
             self.Answer4 = answer4
    }
   
    
    mutating func update(question: String, answer1:String, answer2: String?, answer3: String?, answer4: String?){
       self.Question = question
       self.Answer1 = answer1
       self.Answer2 = answer2
       self.Answer3 = answer3
       self.Answer4 = answer4
       }
    
    
}
