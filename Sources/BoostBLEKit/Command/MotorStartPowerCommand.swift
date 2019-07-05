//
//  MotorStartPowerCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct MotorStartPowerCommand: Command {
    
    public let portId: PortId
    public let power: Int8
    
    /// power: 0 = FLOAT, 127 = BRAKE
    public init(portId: PortId, power: Int8) {
        self.portId = portId
        self.power = power
    }
    
    public var data: Data {
        let power = UInt8(bitPattern: self.power)
        return Data([0x08, 0x00, 0x81, portId, 0x11, 0x51, 0x00, power])
    }
}
