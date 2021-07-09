//
//  Notification.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum Notification {
    
    case hubProperty(HubProperty, HubProperty.Value)
    case connected(PortId, IOType)
    case disconnected(PortId)
    case sensorValue(PortId, Data)
}

extension Notification {
    
    public init?(data: Data) {
        guard data.count >= 3 else { return nil }
        
        switch data[2] {
        case 0x01: // Hub Property
            guard data.count >= 6 else { return nil }
            guard let hubProperty = HubProperty(rawValue: data[3]) else { return nil }
            guard let value = hubProperty.value(from: Data(data.suffix(from: 5))) else { return nil }
            self = .hubProperty(hubProperty, value)
            
        case 0x04: // Port Information
            guard data.count >= 5 else { return nil }
            let portId = data[3]
            
            switch data[4] {
            case 0x00:
                self = .disconnected(portId)
            case 0x01, 0x02:
                guard data.count >= 6 else { return nil }
                let ioType = IOType(rawValue: data[5])
                self = .connected(portId, ioType)
            default:
                return nil
            }
            
        case 0x45: // Sensor Value
            guard data.count >= 5 else { return nil }
            let portId = data[3]
            let value = data.suffix(from: 4)
            self = .sensorValue(portId, value)
            
        default:
            return nil
        }
    }
}

extension Notification: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .hubProperty(let hubProperty, let value):
            return "\(hubProperty): \(value)"
        case .connected(let portId, let ioType):
            return "Connected \(ioType) into Port \(portId.hexString)"
        case .disconnected(let portId):
            return "Disconnected an I/O from Port \(portId.hexString)"
        case .sensorValue(let portId, let value):
            let hex = value.map { $0.hexString }.joined(separator: " ")
            return "Sensor value [\(hex)] from Port \(portId.hexString)"
        }
    }
}

private extension UInt8 {
    
    var hexString: String {
        return String(format: "%02x", self)
    }
}
