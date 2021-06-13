//
//  backDropGradient.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/21/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

struct BackDropGradient {

    func setGradientBackground(colorBottom: UIColor, colorTop: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]

      }
}
