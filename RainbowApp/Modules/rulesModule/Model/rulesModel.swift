//
//  5Model.swift
//

import UIKit


enum RulesModel {
    enum Label {
        static let textLables = "Синий" 
        static let titleOfRulesGame = "ПРАВИЛА ИГРЫ"
        static let desctiptionFirstPart = "На экране в случайном месте появляется слово, обозначающее цвет, например: написано «синий»:"
        static let descriptionSecondPart = "Нужно произнести вслух цвет слова (если опция «подложка для букв» выключена) или цвет фона, на котором написано слово (если опция «подложка для букв» включена): говорим «зеленый» ."
        static let desctiptionThirdPart = " В игре можно изменять скорость от 1x до 5x. А так же длительность игры."
        static let backgroundOff = "Подложка выключена"
        static let backgroundOn = "Подложка включена"
        
    }
    enum Color {
        static let colorForTitle = hexStringToUIColor(hex: "#BE2E6A")
    }
}


