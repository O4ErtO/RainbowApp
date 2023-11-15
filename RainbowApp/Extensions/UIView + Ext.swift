//
//  UIView + Ext.swift
//  RainbowApp
//
//  Created by Николай on 15.11.2023.
//
import UIKit

extension UIView {
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handlerIn), for: [
            .touchDragInside,
            .touchDown
        ])
        
        button.addTarget(self, action: #selector(handlerOut), for: [
            .touchDragOutside,
            .touchUpOutside,
            .touchUpInside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handlerIn(_ button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            // Уменьшаем размер кнопки и изменяем ее прозрачность
            button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            button.alpha = 0.7
        })
    }
    
    @objc func handlerOut(_ button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            // Возвращаем размер кнопки и ее прозрачность к исходным значениям
            button.transform = .identity
            button.alpha = 1.0
        })
    }
}

