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
        
        public var connectedIOs: [PortId : IOType] = [:]
        
        public let portMap: [Port: PortId] = [
            .A:     0x00,
            .B:     0x01,
        ]
    }
}
