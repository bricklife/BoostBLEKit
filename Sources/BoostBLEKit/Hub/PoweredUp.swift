//
//  PoweredUp.swift
//  BoostBLEKit
//
//  Created by ooba on 20/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public final class PoweredUp {
    
    public final class SmartHub: Hub {
        
        public init() {}
        
        public var connectedDevices: [PortId : DeviceType] = [
            0x32: .rgbLight,
            0x3b: .currentSensor,
            0x3c: .voltageSensor,
            ]
        
        public let portMap: [Port: PortId] = [
            .A:     0x00,
            .B:     0x01,
            .AB:    0x39,
            ]
        
        public func powerCommand(port: Port, power: Int8) -> Command? {
            guard let portId = portId(for: port) else { return nil }
            guard let deviceType = connectedDevices[portId] else { return nil }
            
            switch deviceType {
            case .mediumMotor, .trainMotor:
                return MotorPowerCommand(portId: portId, power: power)
            default:
                return nil
            }
        }
    }
}
