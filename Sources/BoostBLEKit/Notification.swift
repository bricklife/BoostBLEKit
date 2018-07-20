//
//  Notification.swift
//  BoostBLEKit
//
//  Created by ooba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum Notification {
    
    case connected(PortId, DeviceType)
    case disconnected(PortId)
}

extension Notification {
    
    public init?(data: Data) {
        guard data.count >= 3 else { return nil }
        
        switch data[2] {
        case 0x04:
            guard data.count >= 5 else { return nil }
            let portId = data[3]
            
            switch data[4] {
            case 0x00:
                self = .disconnected(portId)
            case 0x01, 0x02:
                guard data.count >= 6 else { return nil }
                guard let deviceType = DeviceType(rawValue: data[5]) else { return nil }
                self = .connected(portId, deviceType)
            default:
                return nil
            }
            
        default:
            return nil
        }
    }
}

extension Notification: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .connected(let portId, let deviceType):
            return "Connected \(deviceType) into \(portId)"
        case .disconnected(let portId):
            return "Disconnected a device from \(portId)"
        }
    }
}
