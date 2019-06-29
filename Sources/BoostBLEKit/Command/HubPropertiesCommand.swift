//
//  HubPropertiesCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 30/06/2019.
//  Copyright © 2019 bricklife.com. All rights reserved.
//

import Foundation

public struct HubPropertiesCommand: Command {
    
    public enum Operation: UInt8 {
        case set            = 0x01
        case enableUpdates  = 0x02
        case disableUpdates = 0x03
        case reset          = 0x04
        case requestUpdate  = 0x05
        case update         = 0x06
    }
    
    public let property: HubProperty
    public let operation: Operation
    
    public init(property: HubProperty, operation: Operation) {
        self.property = property
        self.operation = operation
    }
    
    public var data: Data {
        return Data([0x06, 0x00, 0x01, property.rawValue, operation.rawValue, 0x00])
    }
}
