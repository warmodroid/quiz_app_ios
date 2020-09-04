//
//  Button+Extension.swift
//  Trivia App
//
//  Created by Mohit Agrawal on 04/09/20.
//  Copyright © 2020 Mohit Agrawal. All rights reserved.
//

import Foundation
import UIKit

enum QUIZ_TYPE {
    case single_answer
    case multiple_anser
}

extension UIButton {
    func makeRound() {
        layer.cornerRadius = frame.size.height / 2
        shadow()
    }
}

extension UIView {
    func shadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
    }
    
    func corderRadius(_ r: CGFloat) {
        layer.cornerRadius = r
    }
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 10, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 10, y: center.y))

        layer.add(animation, forKey: "position")
    }
}
