//
//  Motor.swift
//  BoostBLEKit
//
//  Created by ooba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct Motor {
    
    public let port: Port
    public let deviceType: DeviceType
    
    public init?(port: Port, deviceType: DeviceType) {
        switch (port, deviceType) {
        case (.A, .builtInMotor),
             (.B, .builtInMotor),
             (.C, .interactiveMotor),
             (.D, .interactiveMotor):
            self.port = port
            self.deviceType = deviceType
        default:
            return nil
        }
    }
    
    public func powerCommand(power: Int8) -> MotorPowerCommand {
        return MotorPowerCommand(port: port, power: power)
    }
}
