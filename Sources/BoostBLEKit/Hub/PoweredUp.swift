//
//  PoweredUp.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 20/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public final class PoweredUp {
    
    public final class SmartHub: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId : IOType] = [
            0x32: .rgbLight,
            0x3b: .currentSensor,
            0x3c: .voltageSensor,
        ]
        
        public let portMap: [Port: PortId] = [
            .A:     0x00,
            .B:     0x01,
            .AB:    0x39,
        ]
    }
    
    public final class RemoteControl: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId : IOType] = [
            0x00: .powerControlButton,
            0x01: .powerControlButton,
            0x34: .rgbLight,
            0x3b: .voltageSensor,
        ]
        
        public let portMap: [Port: PortId] = [:]
    }
}
