//
//  InteractiveMotorPowerCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 20/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct InteractiveMotorPowerCommand: Command {
    
    public let portId: PortId
    public let power: Int8
    
    public var data: Data {
        let power = UInt8(bitPattern: self.power)
        return Data([0x09, 0x00, 0x81, portId, 0x11, 0x07, power, 0x64, 0x03])
    }
}
