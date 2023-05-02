//
//  SuperMario.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 2021/05/01.
//  Copyright © 2021 bricklife.com. All rights reserved.
//

import Foundation

public final class SuperMario {
    
    private static let IOTypeMap: [PortId: IOType] = [
        0x00: .marioAccelerometer,
        0x01: .marioColorBarcodeSensor,
        0x02: .marioPantsSensor,
        0x06: .voltageSensor,
    ]
    
    public final class Mario: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId: IOType] = IOTypeMap
        
        public let portMap: [Port: PortId] = [:]
    }
    
    public final class Luigi: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId: IOType] = IOTypeMap
        
        public let portMap: [Port: PortId] = [:]
    }
    
    public final class Peach: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId: IOType] = IOTypeMap
        
        public let portMap: [Port: PortId] = [:]
    }
}
