//
//  Spike.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 2021/09/12.
//  Copyright © 2021 bricklife.com. All rights reserved.
//

import Foundation

public final class Spike {
    
    public final class EssentialHub: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId : IOType] = [
            0x31: .rgbLight,
            0x3b: .currentSensor,
            0x3c: .voltageSensor,
        ]
        
        public let portMap: [Port: PortId] = [
            .A:     0x00,
            .B:     0x01,
        ]
    }
}
