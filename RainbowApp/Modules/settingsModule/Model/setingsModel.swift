//
//  RainbowApp
//

import UIKit

struct SettingsModel: Codable {
    var gameTime: Int
    var changeTime: Int
    var isCountTask: Bool
    var selectedColors: [Bool]
    var textSize: Int
    var isTextBackground: Bool
    var backgroundColor: String
    var wordPosition: String
}
    
enum BgColor: String {
    case black
    case gray
    case white
}

enum WordPosition {
    case random
    case center
}

enum SettingsLabel {
    static let gameTime = "Время игры"
    static let speed = "Скорость смены заданий"
    static let check = "Игра с проверкой заданий"
    static let letterColors = "Цвета букв"
    static let letterSize = "Размер букв"
    static let letterBg = "Подложка для букв"
    static let bg = "Цвет фона"
    static let position = "Расположение слова на экране"
}


