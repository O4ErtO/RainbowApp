//
//  5Model.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//
import UIKit

struct GameModel: Codable {
    var isPlaying = false
    var currentCount = 0
    var currentTime = 0
    var numberOfQuestions = 0
}

enum Image {
    static let dot = UIImage(named: "dot")
    static let chek = UIImage(named: "chek")
}

