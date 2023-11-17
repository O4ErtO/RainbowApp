//
//  GameData.swift
//

import UIKit

let gameData = GameData()

class GameData {

    lazy var settingsModel =  UserDefaultService.shared.getData(forKey: "Settings") ?? SettingsModel()
    lazy var results =  UserDefaultService.shared.getData(forKey: "Rounds") ?? ResultsModel()
    lazy var gameModel = UserDefaultService.shared.getData(forKey: "Game")  ?? GameModel()
    
    let allColors: [UIColor] = [
        .cyan, .green, .blue, .purple, .systemPink, .orange, .red,
        .systemTeal, .magenta, .systemIndigo, .black, .gray
    ]
    
    lazy var selectedColors = {
        allColors.elements(at: gameData.settingsModel.selectedColors.whereElements(true))
    }()
    
    // Methods
    func saveSettings () {
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Settings")
        updateColors()
    }
    
    func saveResults () {
        UserDefaultService.shared.saveData(type: results, forKey: "Rounds")
    }
    
    func saveGameModel () {
        UserDefaultService.shared.saveData(type: gameModel, forKey: "Game")
    }
    
    func deleteResults() {
        UserDefaultService.shared.removeData(forKey: "Rounds")
        results = ResultsModel()
        saveResults()
    }
    
    func updateColors() {
        selectedColors = allColors.elements(at: gameData.settingsModel.selectedColors.whereElements(true))
        if selectedColors.isEmpty {
            selectedColors.append(.systemPink)
        }
    }
    
    func addResult(_ round: Round) {
        results.results.append(round)
        saveResults()
    }
    
    func getFontColor() -> UIColor {
        settingsModel.backgroundColor == "#000000" ? .white : .black
    }
}
