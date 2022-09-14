//
//  SuperMario.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 2021/05/01.
//  Copyright © 2021 bricklife.com. All rights reserved.
//

import Foundation

public final class SuperMario {
    
    public final class Mario: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId: IOType] = [:]
        
        public let portMap: [Port: PortId] = [:]
    }
    
    public final class Luigi: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId: IOType] = [:]
        
        public let portMap: [Port: PortId] = [:]
    }
    
    public final class Peach: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId: IOType] = [:]
        
        public let portMap: [Port: PortId] = [:]
    }
}
