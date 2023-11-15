//
//  ColorboxView.swift
//

import UIKit

class ColorboxView: UIView {
    
    var isChecked = false {
        didSet {
            imageView.isHidden = !isChecked
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor =  .white
        imageView.image = UIImage(systemName: "checkmark")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        layoutSubviews()
    }
    
    convenience init(frame: CGRect, color: UIColor) {
        self.init(frame: frame)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: -2, width: frame.size.width, height: frame.size.height)
    }
    
    func toggle() {
        self.isChecked = !isChecked
    }
}
