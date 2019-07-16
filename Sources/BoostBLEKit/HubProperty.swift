//
//  HubProperty.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 30/06/2019.
//  Copyright © 2019 bricklife.com. All rights reserved.
//

import Foundation

public enum HubProperty: UInt8, CaseIterable {
    
    case advertisingName                = 0x01
    case button                         = 0x02
    case firmwareVersion                = 0x03
    case hardwareVersion                = 0x04
    case rssi                           = 0x05
    case batteryVoltage                 = 0x06
    case batteryType                    = 0x07
    case manufacturerName               = 0x08
    case radioFirmwareVersion           = 0x09
    case legoWirelessProtocolVersion    = 0x0A
    case systemTypeId                   = 0x0B
    case HWNetworkId                    = 0x0C
    case primaryMacAddress              = 0x0D
    case secondaryMacAddress            = 0x0E
    case hardwareNetworkFamily          = 0x0F
    
    public enum Encoding {
        case bool
        case uint8
        case int8
        case string
        case versionNumber
        case lwpVersionNumber
        case macAddress
    }
    
    public enum Value {
        case bool(Bool)
        case uint8(UInt8)
        case int8(Int8)
        case string(String)
    }
    
    public var encoding: Encoding {
        switch self {
        case .advertisingName:
            return .string
        case .button:
            return .bool
        case .firmwareVersion:
            return .versionNumber
        case .hardwareVersion:
            return .versionNumber
        case .rssi:
            return .int8
        case .batteryVoltage:
            return .uint8
        case .batteryType:
            return .uint8
        case .manufacturerName:
            return .string
        case .radioFirmwareVersion:
            return .string
        case .legoWirelessProtocolVersion:
            return .lwpVersionNumber
        case .systemTypeId:
            return .uint8
        case .HWNetworkId:
            return .uint8
        case .primaryMacAddress:
            return .macAddress
        case .secondaryMacAddress:
            return .macAddress
        case .hardwareNetworkFamily:
            return .uint8
        }
    }
    
    public func value(from data: Data) -> Value? {
        switch encoding {
        case .bool:
            return .bool(data[0] == 0 ? false : true)
            
        case .uint8:
            return .uint8(data[0])
            
        case .int8:
            return .int8(data.withUnsafeBytes({ $0.load(as: Int8.self) }))
            
        case .string:
            guard let string = String(data: data, encoding: .utf8) else { return nil }
            return .string(string)
            
        case .versionNumber:
            precondition(data.count == 4)
            let major = data[3] & 0xF0 >> 4
            let minor = data[3] & 0x0F
            let bugfix = data[2] & 0x0F
            let buildNumber = UInt16(data[1]) << 8 + UInt16(data[0])

            return .string("\(major).\(minor).\(bugfix).\(buildNumber)")
            
        case .lwpVersionNumber:
            precondition(data.count == 2)
            return .string("\(data[1]).\(data[0])")
            
        case .macAddress:
            precondition(data.count == 6)
            return .string(String(format: "%02X-%02X-%02X-%02X-%02X-%02X", data[0], data[1], data[2], data[3], data[4],data[5]))
        }
    }
    
    /// Returns `true` if live updates can be en- / disabled for this property
    public var supportsUpdate: Bool {
        switch self {
        case .advertisingName, .button, .rssi, .batteryVoltage:
            return true
        default:
            return false
        }
    }
    
}


extension HubProperty: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .advertisingName:
            return "Advertising Name"
        case .button:
            return "Button"
        case .firmwareVersion:
            return "Firmware Version"
        case .hardwareVersion:
            return "Hardware Version"
        case .rssi:
            return "RSSI"
        case .batteryVoltage:
            return "Battery Voltage [%]"
        case .batteryType:
            return "Battery Type"
        case .manufacturerName:
            return "Manufacturer Name"
        case .radioFirmwareVersion:
            return "Radio Firmware Version"
        case .legoWirelessProtocolVersion:
            return "LEGO Wireless Protocol Version"
        case .systemTypeId:
            return "System Type ID"
        case .HWNetworkId:
            return "H/W NetworkId"
        case .primaryMacAddress:
            return "Primary MAC Address"
        case .secondaryMacAddress:
            return "Secondary MAC Address"
        case .hardwareNetworkFamily:
            return "Hardware Network Family"
        }
    }
    
}

extension HubProperty.Value: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .string(let string):
            return string
        case .bool(let bool):
            return bool ? "yes" : "no"
        case .uint8(let int):
            return int.description
        case .int8(let int):
            return int.description
        }
    }
    
}
