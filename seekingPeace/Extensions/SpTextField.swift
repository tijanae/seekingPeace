//
//  spTextField.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/2/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SpTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(placeholder: String) {
        self.init(frame: .zero)

        configure(placeholder: placeholder)
    }

    var textPadding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
           let rect = super.textRect(forBounds: bounds)
           return rect.inset(by: textPadding)
       }

       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           let rect = super.editingRect(forBounds: bounds)
           return rect.inset(by: textPadding)
       }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.placeholderRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

    private func configure(placeholder: String) {
        backgroundColor = CrayonBox.Green.mid
        borderStyle = .line
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textColor = CrayonBox.White.opaque
        layer.borderWidth = 2
        layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
