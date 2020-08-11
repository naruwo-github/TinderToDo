//
//  UIButtonExtension.swift
//  TinderToDo
//
//  Created by Narumi Nogawa on 2020/08/11.
//  Copyright © 2020 Narumi Nogawa. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class ExtendedButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var enableShadow: Bool = false {
        didSet {
            if enableShadow {
                setButtonShadow()
            }
        }
    }
    
    func setButtonShadow() {
        self.clipsToBounds = false
        let layer = self.layer
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.4
    }
}
