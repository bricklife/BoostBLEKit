//
//  DeviceType.swift
//  BoostBLEKit
//
//  Created by ooba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum DeviceType: UInt8 {
    
    case colorDistanceSensor    = 0x25
    case interactiveMotor       = 0x26
    case builtInMotor           = 0x27
}

extension DeviceType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .colorDistanceSensor:
            return "Color & Distance Sensor"
        case .interactiveMotor:
            return "Interactive Motor"
        case .builtInMotor:
            return "Built-in Motor"
        }
    }
}
