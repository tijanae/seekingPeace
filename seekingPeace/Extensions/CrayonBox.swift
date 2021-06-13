//
//  CrayonBox.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/28/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

struct CrayonBox {

    struct Green {
        static let sheer = UIColor(red: 8/255, green: 100/255, blue: 8/255, alpha: 0.2)
        static let mid = UIColor(red: 8/255, green: 100/255, blue: 8/255, alpha: 0.5)
        static let opaque = UIColor(red: 8/255.0, green: 100/255.0, blue: 8/255.0, alpha: 1)
    }

    struct Black {
        static let sheer = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        static let mid = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        static let opaque = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

    struct White {
        static let sheer = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        static let mid = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        static let opaque = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
}
