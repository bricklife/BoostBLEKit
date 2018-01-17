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
    
    public func powerCommand(power: Int8) -> MotorPowerCommand {
        return MotorPowerCommand(port: port, power: power)
    }
}
