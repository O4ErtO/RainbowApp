//
//  RainbowApp
//

import UIKit

struct SettingsModel: Codable {
    var gameTime: Int = 11
    var changeTime: Int = 2
    var isCountTask: Bool = false
    var selectedColors: [Bool] = Array(repeating: true, count: 12)
    var textSize: CGFloat = 24.0
    var isTextBackground: Bool = true
    var backgroundColor: String = "#00000033"
    var wordPosition: WordPosition = .random
}

enum WordPosition: Int, Codable {
    case center
    case random
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
