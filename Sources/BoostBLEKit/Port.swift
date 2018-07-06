//
//  Port.swift
//  BoostBLEKit
//
//  Created by ooba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum Port: UInt8 {
    
    case A  = 0x37
    case B  = 0x38
    case C  = 0x01
    case D  = 0x02
    case AB = 0x39
    
    case internal32 = 0x32
    case internal3a = 0x3a
    case internal3b = 0x3b
    case internal3c = 0x3c
}

extension Port: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .A:
            return "A"
        case .B:
            return "B"
        case .C:
            return "C"
        case .D:
            return "D"
        case .AB:
            return "A and B"
        default:
            return String(format: "Internal 0x%02x", rawValue)
        }
    }
}
