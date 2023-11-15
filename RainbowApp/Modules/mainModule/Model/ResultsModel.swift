//
//  ResultsModel.swift
//

import Foundation

struct ResultsModel: Codable {
    var results = [Round]()
}

struct Round: Codable {
    var time: Double
    var guessed: Int
    var numberOfQuestions: Int
    var speed: Int
}
