//
//  GameData.swift
//

import UIKit

// Singleton 1 (global namespace)
let gameData = GameData()

class GameData {

    lazy var settingsModel =  UserDefaultService.shared.getData(forKey: "Settings") ?? SettingsModel()
    lazy var results =  UserDefaultService.shared.getData(forKey: "Results") ?? ResultsModel()
    lazy var gameModel = UserDefaultService.shared.getData(forKey: "Game")  ?? GameModel()
    
    // functions
    func saveSettings () {
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Settings")
    }
    
    private func saveResults () {
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Results")
    }
    
    private func saveGameModel () {
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Game")
    }
}
