//
//  GameData.swift
//

import UIKit

let gameData = GameData()

class GameData {

    lazy var settingsModel =  UserDefaultService.shared.getData(forKey: "Settings") ?? SettingsModel()
    lazy var results =  UserDefaultService.shared.getData(forKey: "Results") ?? ResultsModel()
    lazy var gameModel = UserDefaultService.shared.getData(forKey: "Game")  ?? GameModel()
    
    // Methods
    func saveSettings () {
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Settings")
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
}
