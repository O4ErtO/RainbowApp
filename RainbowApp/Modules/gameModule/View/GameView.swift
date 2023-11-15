//
//  5View.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class GameView: UIView {
    
    //MARK: - Parameters
    lazy var firstButton = Button(color: randomColor(colors: colorsArray), title: randomTitle(titles: titlesArray), titleColor: .white)
    lazy var secondButton = Button(color: randomColor(colors: colorsArray), title: randomTitle(titles: titlesArray), titleColor: .white)
    lazy var thirdButton = Button(color: randomColor(colors: colorsArray), title: randomTitle(titles: titlesArray), titleColor: .white)
    lazy var fourButton = Button(color: randomColor(colors: colorsArray), title: randomTitle(titles: titlesArray), titleColor: .white)
    lazy var fiveButton = Button(color: randomColor(colors: colorsArray), title: randomTitle(titles: titlesArray), titleColor: .white)
    
    private let heightAnch: CGFloat = 116
    private let colorsArray: [UIColor]
    private let titlesArray: [String]
    
    //MARK: - Init
    init(colorsArray: [UIColor], titlesArray: [String]) {
        self.titlesArray = titlesArray
        self.colorsArray = colorsArray
        super.init(frame: .zero)
        setupView()
        setContraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Methods
    private func randomConts () -> CGFloat {
        let array = [20,70,120,170]
        return CGFloat(array.randomElement()!)
    }
    
    func randomColor (colors: [UIColor]) -> UIColor {
        return colors.randomElement() ?? .red
    }
    
    func randomTitle (titles: [String]) -> String {
        return titles.randomElement() ?? "Green"
    }
    
}

extension GameView {
    private func setupView() {
        backgroundColor = R.Color.backgroundColor
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
        addSubview(fourButton)
        addSubview(fiveButton)
        
    }
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            firstButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: heightAnch),
            secondButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: heightAnch),
            thirdButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            fourButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: heightAnch),
            fourButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            fiveButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: heightAnch),
            fiveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
        ])
    }
}
