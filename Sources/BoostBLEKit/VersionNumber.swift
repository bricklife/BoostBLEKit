//
//  VersionNumber.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 2022/06/03.
//  Copyright © 2022 bricklife.com. All rights reserved.
//

import Foundation

public struct VersionNumber {
    
    public let majorVersion: UInt
    public let minorVersion: UInt
    public let bugFixingNumber: UInt
    public let buildNumber: UInt
    
    public init(data: Data) {
        let version = data.withUnsafeBytes { $0.load(as: Int32.self).littleEndian }
        majorVersion = UInt(version >> 28 & 0x7)
        minorVersion = UInt(version >> 24 & 0xf)
        bugFixingNumber = UInt(version >> 16 & 0xff)
        buildNumber = UInt(version & 0xffff)
    }
}

extension VersionNumber: CustomStringConvertible {
    
    public var description: String {
        return String(format: "%x.%x.%02x.%04x", majorVersion, minorVersion, bugFixingNumber, buildNumber)
    }
}
