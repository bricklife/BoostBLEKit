//
//  RGBLight.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 06/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct RGBLight: Device {
    
    public let port: Port
    
    public init?(port: Port, deviceType: DeviceType) {
        switch deviceType {
        case .rgbLight:
            self.port = port
        default:
            return nil
        }
    }
    
    public func colorCommand(color: RGBLightColorCommand.Color) -> RGBLightColorCommand {
        return RGBLightColorCommand(port: port, color: color)
    }
}
