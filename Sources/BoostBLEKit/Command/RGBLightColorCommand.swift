//
//  RGBLightColorCommand.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 06/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public struct RGBLightColorCommand: Command {
    
    public let portId: PortId
    public let color: Color
    
    public var data: Data {
        return Data([0x08, 0x00, 0x81, portId, 0x11, 0x51, 0x00, color.rawValue])
    }
}
