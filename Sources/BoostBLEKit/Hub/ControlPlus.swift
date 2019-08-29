//
//  ControlPlus.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 2019/08/18.
//  Copyright © 2019 bricklife.com. All rights reserved.
//

import Foundation

public final class ControlPlus {
    
    public final class SmartHub: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId : IOType] = [
            0x32: .rgbLight,
            0x3b: .currentSensor,
            0x3c: .voltageSensor,
            // 0x3d: 0x3c,
            // 0x60: 0x3c,
            // 0x61: 0x39,
            // 0x62: 0x3a,
            // 0x63: 0x3b,
            // 0x64: 0x36,
        ]
        
        public let portMap: [Port: PortId] = [
            .A:     0x00,
            .B:     0x01,
            .C:     0x02,
            .D:     0x03,
        ]
    }
}
