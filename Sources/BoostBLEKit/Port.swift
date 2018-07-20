//
//  Port.swift
//  BoostBLEKit
//
//  Created by ooba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public typealias PortId = UInt8

public enum Port {
    
    case A
    case B
    case C
    case D
    case AB
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
        }
    }
}
