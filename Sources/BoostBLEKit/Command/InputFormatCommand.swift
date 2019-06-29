//
//  InputFormatCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 10/09/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct InputFormatCommand: Command {
    
    public let portId: PortId
    public let mode: UInt8
    public let subscribe: Bool
    
    public var data: Data {
        return Data([0x0a, 0x00, 0x41, portId, mode, 0x01, 0x00, 0x00, 0x00, subscribe ? 0x01 : 0x00])
    }
}
