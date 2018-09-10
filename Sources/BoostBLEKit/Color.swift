//
//  Color.swift
//  BoostBLEKit
//
//  Created by ooba on 07/08/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum Color: UInt8 {
    
    case black      = 0x00
    case pink       = 0x01
    case purple     = 0x02
    case blue       = 0x03
    case lightBlue  = 0x04
    case lightGreen = 0x05
    case green      = 0x06
    case yellow     = 0x07
    case orange     = 0x08
    case red        = 0x09
    case white      = 0x0a
    case none       = 0xff
}

extension Color: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .black:
            return "Black"
        case .pink:
            return "Pink"
        case .purple:
            return "Purple"
        case .blue:
            return "Blue"
        case .lightBlue:
            return "Light Blue"
        case .lightGreen:
            return "Light Green"
        case .green:
            return "Green"
        case .yellow:
            return "Yellow"
        case .orange:
            return "Orange"
        case .red:
            return "Red"
        case .white:
            return "White"
        case .none:
            return "None"
        }
    }
}
