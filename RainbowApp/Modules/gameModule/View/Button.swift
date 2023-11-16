//
//  Buttons.swift
//  RainbowApp
//
//  Created by Николай on 14.11.2023.
//

import UIKit

protocol ButtonGameDelegate: AnyObject {
    func buttonTapped(count: Int)
}

final class Button: UIButton {
    weak var delegate: ButtonGameDelegate?
    var isActive = false
    var count = 0
    private var backgroundColorIsEmpty = !gameData.settingsModel.isTextBackground
    private var titleSize = gameData.settingsModel.textSize
    private var chek = gameData.settingsModel.isCountTask
    
    let dotView: UIImageView = {
        let view = UIImageView()
        view.image = Image.dot
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(color: UIColor?, title: String?, titleColor: UIColor?) {
        super.init(frame: .zero)
        backgroundColor = backgroundIsEmpty(color: (color ?? .red))
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: titleSize)
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .init(width: 5, height: 10)
        layer.shadowRadius =  5
        layer.shouldRasterize = true
        layer.masksToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(dotView)
        addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        makeSystem(self)
        buttonIsHidden(button: self)
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundIsEmpty(color: UIColor) -> UIColor {
        if backgroundColorIsEmpty {
            return .clear
        } else {
            return color
        }
    }
        
    private func buttonIsHidden(button: UIButton) {
        if chek {
            dotView.isHidden = false
            button.isEnabled = true
        } else {
            dotView.isHidden = true
            button.isEnabled = false
        }
    }
    
    @objc private func didButtonTapped() {
        
        if let checkImageView = dotView.subviews.first(where: { $0 is UIImageView }) {
            checkImageView.removeFromSuperview()
            self.count -= 1
        } else {
            let checkImageView = UIImageView(image: Image.chek)
            dotView.addSubview(checkImageView)
            self.count += 1
        }
        isActive.toggle()
        delegate?.buttonTapped(count: count)
    }
    
    private func setContraints () {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 205),
            heightAnchor.constraint(equalToConstant: 40),
            
            dotView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dotView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            dotView.widthAnchor.constraint(equalToConstant: 20),
            dotView.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
