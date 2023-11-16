//
//  GameData.swift
//

import UIKit

let gameData = GameData()

class GameData {

    lazy var settingsModel =  UserDefaultService.shared.getData(forKey: "Settings") ?? SettingsModel()
    lazy var results =  UserDefaultService.shared.getData(forKey: "Results") ?? ResultsModel()
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
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Results")
    }
    
    func saveGameModel () {
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Game")
    }
    
    func deleteResults() {
        UserDefaultService.shared.removeData(forKey: "Results")
    }
    
    func updateColors() {
        selectedColors = allColors.elements(at: gameData.settingsModel.selectedColors.whereElements(true))
        if selectedColors.isEmpty {
            selectedColors.append(.systemPink)
        }
    }
}
