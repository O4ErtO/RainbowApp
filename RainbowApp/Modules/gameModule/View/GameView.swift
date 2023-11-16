//
//
//  RainbowApp
//

import UIKit

class GameView: UIView {
    
    //MARK: - Parameters
    lazy var firstButton = Button(
        color: colorsArray[0],
        title: titlesArray[0],
        titleColor: .white)
    lazy var secondButton = Button(
        color: colorsArray[safe: 1] ?? colorsArray[Int.random(in: 0..<colorsArray.count)],
        title: titlesArray[1],
        titleColor: .white)
    lazy var thirdButton = Button(
        color: colorsArray[safe: 2] ?? colorsArray[Int.random(in: 0..<colorsArray.count)],
        title: titlesArray[2],
        titleColor: .white)
    lazy var fourButton = Button(
        color: colorsArray[safe: 3] ?? colorsArray[Int.random(in: 0..<colorsArray.count)],
        title: titlesArray[3],
        titleColor: .white)
    lazy var fiveButton = Button(
        color: colorsArray[safe: 4] ?? colorsArray[Int.random(in: 0..<colorsArray.count)],
        title: titlesArray[4],
        titleColor: .white)
    
    private let heightAnch: CGFloat = 100
    private var colorsArray: [UIColor]
    private var titlesArray: [String]
    private let titleSpeedButton: String
    
    lazy var speedbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = .red
        button.setTitle(titleSpeedButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //MARK: - Init
    init(colorsArray: [UIColor] = gameData.selectedColors.shuffled(), titlesArray: [String] = ["красный","синий","зеленый","желтый","фиолетовый", "розовый"].shuffled(), titleButton: String) {
        self.titlesArray = titlesArray
        self.colorsArray = colorsArray
        self.titleSpeedButton = titleButton
        super.init(frame: .zero)
        setupView()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods
    private func randomConts () -> CGFloat {
        return CGFloat(Int.random(in: 20...170))
    }
}

extension GameView {
    
    func changeButtons() {
        colorsArray.shuffle()
        titlesArray.shuffle()
            
        if let checkImageView = firstButton.dotView.subviews.first(where: { $0 is UIImageView }) {
            checkImageView.removeFromSuperview()
        }
        firstButton.count = 0
        if let checkImageView = secondButton.dotView.subviews.first(where: { $0 is UIImageView }) {
            checkImageView.removeFromSuperview()
        }
        secondButton.count = 0
        if let checkImageView = thirdButton.dotView.subviews.first(where: { $0 is UIImageView }) {
            checkImageView.removeFromSuperview()
        }
        thirdButton.count = 0
        if let checkImageView = fourButton.dotView.subviews.first(where: { $0 is UIImageView }) {
            checkImageView.removeFromSuperview()
        }
        fourButton.count = 0
        if let checkImageView = fiveButton.dotView.subviews.first(where: { $0 is UIImageView }) {
            checkImageView.removeFromSuperview()
        }
        fiveButton.count = 0

        firstButton.setTitle(titlesArray[0], for: .normal)
        secondButton.setTitle(titlesArray[1], for: .normal)
        thirdButton.setTitle(titlesArray[2], for: .normal)
        fourButton.setTitle(titlesArray[3], for: .normal)
        fiveButton.setTitle(titlesArray[4], for: .normal)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            self.firstButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.secondButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.thirdButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.fourButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.fiveButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
        }
        UIView.animate(withDuration: 0.5) {
            self.firstButton.backgroundColor = self.colorsArray[Int.random(in: 0..<self.colorsArray.count)]
           
            self.thirdButton.backgroundColor = self.colorsArray[safe: 2] ?? self.colorsArray[Int.random(in: 0..<self.colorsArray.count)]
            self.fourButton.backgroundColor = self.colorsArray[safe: 3] ?? self.colorsArray[Int.random(in: 0..<self.colorsArray.count)]
            self.fiveButton.backgroundColor = self.colorsArray[safe: 4] ?? self.colorsArray[Int.random(in: 0..<self.colorsArray.count)]
        }
    }
    
    private func setupView() {
        backgroundColor = R.Color.backgroundColor
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
        addSubview(fourButton)
        addSubview(fiveButton)
        addSubview(speedbutton)
    }
    
    private func setContraints() {
        UIView.animate(withDuration: 0.1) {
            self.firstButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.secondButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.thirdButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.fourButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
            self.fiveButton.frame.origin.x = CGFloat(Int.random(in: 0...150))
        }
        
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: topAnchor, constant: 130),
           // firstButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(Int.random(in: 20...170))),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: heightAnch),
           // secondButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: heightAnch),
          //  thirdButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            fourButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: heightAnch),
           // fourButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            fiveButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: heightAnch),
            //fiveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: randomConts()),
            
            speedbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            speedbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            speedbutton.widthAnchor.constraint(equalToConstant: 50),
            speedbutton.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}
