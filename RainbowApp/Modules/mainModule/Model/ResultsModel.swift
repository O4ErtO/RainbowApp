//
//  ResultsModel.swift
//

import Foundation

struct ResultsModel: Codable {
    var results = [Result]()
}

struct Result: Codable {
    var time: Double
    var guessed: Int
    var numberOfQuestions: Int
    var speed: Int
}


