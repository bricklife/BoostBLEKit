//
//  MotorStartSpeedCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 20/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct MotorStartSpeedCommand: Command {
    
    public let portId: PortId
    public let speed: Int8 // 0: HOLD
    public let maxPower: UInt8
    
    public init(portId: PortId, speed: Int8, maxPower: UInt8 = 0x64) {
        self.portId = portId
        self.speed = speed
        self.maxPower = maxPower
    }
    
    public var data: Data {
        let speed = UInt8(bitPattern: self.speed)
        return Data([0x09, 0x00, 0x81, portId, 0x11, 0x07, speed, maxPower, 0x03])
    }
}
