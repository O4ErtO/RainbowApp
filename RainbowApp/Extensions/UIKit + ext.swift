//
//  UIKit + ext.swift
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subViews: [UIView]) {
        self.init(arrangedSubviews: subViews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UISlider {
    convenience init(maxValue: Float, minValue: Float) {
        self.init()
        self.minimumTrackTintColor = UIColor.orange
        self.maximumValue = maxValue
        self.minimumValue = minValue
        self.value = (maxValue - minValue) / 2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    convenience  init(color: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = color
    }
}
    
extension UILabel {
    convenience init(text: String) {
        self.init()
        self.font = .systemFont(ofSize: 20)
        self.textColor = .black
        self.numberOfLines = 2
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
    }
}

extension UISegmentedControl {
    convenience init(items: [String] , selectedIndex: Int) {
        self.init(items: items)
        self.selectedSegmentIndex = selectedIndex
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStepper {
    convenience init(minValue: Double, maxValue: Double, value: Double) {
        self.init()
        self.value = value
        self.minimumValue = minValue
        self.maximumValue = maxValue
        self.value = value
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UISwitch {
    convenience init(isOn: Bool) {
        self.init()
        self.isOn = isOn
        self.onTintColor = .orange
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
