//
//  MotorPowerCommand.swift
//  BoostBLEKit
//
//  Created by ooba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct MotorPowerCommand: Command {
    
    public let port: Port
    public let power: Int8
    
    public var data: Data {
        let power = UInt8(bitPattern: self.power)
        return Data(bytes: [0x09, 0x00, 0x81, port.rawValue, 0x11, 0x07, power, 0x64, 0x03])
    }
}
