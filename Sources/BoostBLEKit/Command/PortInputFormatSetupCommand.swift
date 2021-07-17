//
//  PortInputFormatSetupCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 10/09/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct PortInputFormatSetupCommand: Command {
    
    public let portId: PortId
    public let mode: UInt8
    public let subscribe: Bool
    
    public init(portId: PortId, mode: UInt8, subscribe: Bool) {
        self.portId = portId
        self.mode = mode
        self.subscribe = subscribe
    }
    
    public var data: Data {
        return Data([0x0a, 0x00, 0x41, portId, mode, 0x01, 0x00, 0x00, 0x00, subscribe ? 0x01 : 0x00])
    }
}
