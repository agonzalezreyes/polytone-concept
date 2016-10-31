//
//  Colors.swift
//  Polytone
//
//  Created by Alejandrina Gonzalez on 10/28/16.
//  Copyright © 2016 Alejandrina Gonzalez Reyes. All rights reserved.
//

import UIKit

extension UIColor {
    convenience public init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    public struct Color {
        public static let polytone = UIColor(hex: 0x1E53CF)
        public static let HarmonicEnergy2 = UIColor(hex: 0x1eaccf)
        public static let color1 = UIColor(hex: 0xE6846E)
        public static let color2 = UIColor(hex: 0x1A538C)
        public static let color3 = UIColor(hex: 0xE24C4F)
        public static let color4 = UIColor(hex: 0xA3C5BF)
        public static let color5 = UIColor(hex: 0x1E7C7F)

        
    }
}
