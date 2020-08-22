//
//  QuizData.swift
//  QuizGame
//
//  Created by Evan Chang on 8/22/20.
//  Copyright © 2020 Evan Chang. All rights reserved.
//

import Foundation

struct QuizData {
    let QuestionBank = [
        QuestionStruct(Question: "Tammy's height is 152CM", Answer: "False", Number: 0, Comment: "Wrong, ARE YOU KIDDING ME, SHE TRICKED YOU, SHE IS 148CM"),
        QuestionStruct(Question: "Eric is a noob at Dota", Answer: "True", Number: 1, Comment: "Wrong, ...... Of Course hes a Noob"),
        QuestionStruct(Question: "Paul is a 真男人", Answer: "True", Number: 2, Comment: "Wrong, According to Joanne he is the manliest man in SMIC"),
        QuestionStruct(Question: "Jessie is Rich", Answer: "True", Number: 3, Comment: "Wrong, She tells everyone how rich she is everytime she drinks"),
        QuestionStruct(Question: "Tammy will find a boyfriend this year", Answer: "unknown", Number: 4, Comment: "Who knows, all we know is she loves Phillp"),
        QuestionStruct(Question: "Joanne will one day remember the rules of 麻将", Answer: "False", Number: 5, Comment: "Wrong, She has the memory of a Goldfish")
    ]

    var QuestionNumber = 0
    var Score = 0
    
    func getScore() -> Int {
        return Score
    }
    
    mutating func nextQuestion() {
            QuestionNumber += 1
        if QuestionNumber > QuestionBank.count-1 {
            QuestionNumber = 0
            Score = 0
        }
    }
    
    mutating func checkAnswer(_ SelectedAnswer: String) -> Bool {
        if SelectedAnswer == QuestionBank[QuestionNumber].Answer {
            Score += 1
            return true
        }
        else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return QuestionBank[QuestionNumber].Question
         //QuestionNumber = randomInt(in: 0...QuestionBank.count-1)
        // Questions.text = QuestionBank.randomElement()?.Question
    }
    
    func getQuestionComment() -> String {
        return QuestionBank[QuestionNumber].Comment
    }
    
    func getProgress() -> Float {
        return (Float(1)/Float(QuestionBank.count))
    }
    
}
