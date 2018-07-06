//
//  RGBLightColorCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 06/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct RGBLightColorCommand: Command {
    
    public enum Color: UInt8 {
        case off = 0x00
        case pink
        case purple
        case blue
        case lightBlue
        case lightGreen
        case green
        case yellow
        case orange
        case red
        case white
    }
    
    public let port: Port
    public let color: Color
    
    public var data: Data {
        return Data(bytes: [0x08, 0x00, 0x81, port.rawValue, 0x11, 0x51, 0x00, color.rawValue])
    }
}
