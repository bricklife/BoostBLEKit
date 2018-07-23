//
//  Hub.swift
//  BoostBLEKitTests
//
//  Created by ooba on 13/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public protocol Hub {
    
    var connectedIOs: [PortId: IOType] { get set }
    var portMap: [Port: PortId] { get }
    
    func port(for portId: PortId) -> Port?
    func portId(for port: Port) -> PortId?
    
    func canSupportAsMotor(ioType: IOType) -> Bool
    
    func motorPowerCommand(port: Port, power: Int8) -> Command?
    func rgbLightColorCommand(color: RGBLightColorCommand.Color) -> Command?
}

public extension Hub {
    
    public func port(for portId: PortId) -> Port? {
        return portMap.first(where: { $0.value == portId })?.key
    }
    
    public func portId(for port: Port) -> PortId? {
        return portMap[port]
    }
    
    public func rgbLightColorCommand(color: RGBLightColorCommand.Color) -> Command? {
        guard let portId = connectedIOs.first(where: { $0.value == .rgbLight })?.key else { return nil }
        return RGBLightColorCommand(portId: portId, color: color)
    }
}
