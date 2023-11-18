//
//  NavBarButton.swift
//  RainbowApp
//
//  Created by Николай on 14.11.2023.
//

import UIKit

protocol NavBarButtonDelegate: AnyObject {
    func leftBarButtonTapped()
    func rightBarButtonTapped()

}

public enum ButtonsType {
    case left
    case right
}

final class NavBarButton: UIButton {
    
    private var buttonsType: ButtonsType = .left
    weak var delegate: NavBarButtonDelegate?
    
    init(with type: ButtonsType) {
        super.init(frame: .zero)
        self.buttonsType = type
        config()
        makeSystem(self)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        self.buttonsType = .left
        config()
    }
    
    private func config() {
        let fontColor: UIColor = gameData.getFontColor()
        switch buttonsType {
            
        case .left:
            
            setImage(R.Image.arrow?.withTintColor(fontColor), for: .normal)
            addTarget(self, action: #selector(tapLeftButton), for: .touchUpInside)
        case .right:
            setImage(R.Image.pause?.withTintColor(fontColor), for: .normal)
            addTarget(self, action: #selector(tapRightButton), for: .touchUpInside)
        }
        makeSystem(self)
    }
    

    
    @objc func tapLeftButton() {
        delegate?.leftBarButtonTapped()
    }
    
    @objc func tapRightButton() {
        delegate?.rightBarButtonTapped()
    }
    
}
