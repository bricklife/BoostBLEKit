//
//  Duplo.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 08/01/2019.
//  Copyright © 2019 bricklife.com. All rights reserved.
//

import Foundation

public final class Duplo {
    
    public final class TrainBase: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId : IOType] = [:]
        
        public let portMap: [Port: PortId] = [:]
        
        public func canSupportAsMotor(ioType: IOType) -> Bool {
            return false
        }
        
        public func motorPowerCommand(port: Port, power: Int8) -> Command? {
            return nil
        }
    }
}
