//
//  NavBarButton.swift
//  RainbowApp
//
//  Created by Николай on 14.11.2023.
//

import UIKit

public enum ButtonsType {
    case left
    case right
}

final class NavBarButton: UIButton {
    
    private var buttonsType: ButtonsType = .left
    
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
        switch buttonsType {
            
        case .left:
            setImage(R.Image.arrow, for: .normal)
        case .right:
            setImage(R.Image.pause, for: .normal)
        }
        makeSystem(self)
    }
    
}
