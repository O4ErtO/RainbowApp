//
//  RainbowApp
//

import UIKit

protocol SpeedButtonDelegate: AnyObject {
    func speedTapped()
}

class GameView: UIView {
    weak var delegate: SpeedButtonDelegate?
    
    //MARK: - Parameters
    var playButtons = [Button]()
    
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
        button.setTitleColor(gameData.getFontColor(), for: .normal)
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
    @objc private func didSpeedTapped() {
        delegate?.speedTapped()
    }
    
    private func randomConts () -> CGFloat {
        return CGFloat(Int.random(in: -80...80) * gameData.settingsModel.wordPosition.rawValue)
    }
}

extension GameView {
    
    func changeButtons() {
        colorsArray.shuffle()
        titlesArray.shuffle()
        
        for (i,button) in playButtons.enumerated() {
            button.setTitle(titlesArray[i], for: .normal)
            if let checkImageView = button.dotView.subviews.first(where: { $0 is UIImageView })
            {
                checkImageView.removeFromSuperview()
                button.count = 0
            }
        }
        
        UIView.animate(withDuration: 0.8) {
            for (i,button) in self.playButtons.enumerated() {
                if gameData.settingsModel.isTextBackground {
                    button.backgroundColor = self.colorsArray[safe: i] ?? self.colorsArray[Int.random(in: 0..<self.colorsArray.count)]
                } else {
                    button.setTitleColor(self.colorsArray[safe: i] ?? self.colorsArray[Int.random(in: 0..<self.colorsArray.count)], for: .normal)
                    if button.titleColor(for: .normal) == .black {
                        button.setTitleColor(gameData.getFontColor(), for: .normal)
                    }
                }
            }
        }
    }
    
    func moveButtons () {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            for button in self.playButtons {
                button.frame.origin.x = CGFloat(Int.random(in: 5...170))
            }
        }
    }
    
    private func setupView() {
        for i in 0...4 {
            playButtons.append(
                Button(
                    color: colorsArray[safe: i] ?? colorsArray[Int.random(in: 0..<colorsArray.count)],
                    title: titlesArray[i],
                    titleColor: gameData.settingsModel.isTextBackground  ?
                        .white :  colorsArray[safe: i] ?? colorsArray[Int.random(in: 0..<colorsArray.count)]
                )
            )
            if playButtons[i].titleColor(for: .normal) == .black {
                playButtons[i].setTitleColor(gameData.getFontColor(), for: .normal)
            }
            addSubview(playButtons[i])
        }
        addSubview(speedbutton)
        backgroundColor = R.Color.backgroundColor
        speedbutton.addTarget(self, action: #selector(didSpeedTapped), for: .touchUpInside)
    }
    
    private func setContraints() {
        for (i,button) in playButtons.enumerated() {
            button.centerXAnchor.constraint(equalTo: centerXAnchor,
                                            constant: randomConts()).isActive = true
            if i == 0 {
                button.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 130).isActive = true
            } else {
                button.topAnchor.constraint(equalTo: playButtons[i-1].bottomAnchor,
                                            constant: heightAnch).isActive = true
            }
        }
        
        NSLayoutConstraint.activate([
            speedbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            speedbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            speedbutton.widthAnchor.constraint(equalToConstant: 50),
            speedbutton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
