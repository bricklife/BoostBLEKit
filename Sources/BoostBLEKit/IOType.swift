//
//  IOType.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum IOType: UInt8 {
    
    case mediumMotor            = 0x01
    case trainMotor             = 0x02
    case ledLight               = 0x08
    case voltageSensor          = 0x14
    case currentSensor          = 0x15
    case piezoSpeaker           = 0x16
    case rgbLight               = 0x17
    case tiltSensor             = 0x22
    case motionSensor           = 0x23
    case colorAndDistanceSensor = 0x25
    case interactiveMotor       = 0x26
    case builtInMotor           = 0x27
    case builtInTiltSensor      = 0x28
    case trainBaseMotor         = 0x29
    case trainBaseSpeaker       = 0x2a
    case trainBaseColorSensor   = 0x2b
    case trainBaseSpeedometer   = 0x2c
    case LargeMotor             = 0x2e
    case XLargeMotor            = 0x2f
}

extension IOType {
    
    public var canSupportMotorStartPowerCommand: Bool {
        switch self {
        case .mediumMotor, .trainMotor, .ledLight, .interactiveMotor, .builtInMotor, .trainBaseMotor:
            return true
        default:
            return false
        }
    }
    
    public var defaultSensorMode: UInt8? {
        switch self {
        case .mediumMotor:
            return nil
        case .trainMotor:
            return nil
        case .ledLight:
            return nil
        case .voltageSensor:
            return nil // return 0
        case .currentSensor:
            return nil // return 0
        case .piezoSpeaker:
            return nil
        case .rgbLight:
            return 0 // Not working on Boost and Powered Up
        case .tiltSensor:
            return 1 // 0: Tilt (x,y), 1: 2D Orientation, 2: Impact Count?? (3 bytes) 3: Tilt (x,y,z)
        case .motionSensor:
            return 0 // 0: Distance, 1: Count, 2: ?? (6 bytes)
        case .colorAndDistanceSensor:
            return 8 // 8: Color, Distance, and Ambient Light Level
        case .interactiveMotor:
            return 2 // 0: ??, 1: Speed, 2: Position
        case .builtInMotor:
            return 2 // 0: ??, 1: Speed, 2: Position
        case .builtInTiltSensor:
            return 2 // 0: Tilt (x,y), 1: 2D Orientation, 2: 3D Orientation, 3: Impact Count, 4: Tilt (x,y,z)
        case .trainBaseMotor:
            return nil
        case .trainBaseSpeaker:
            return nil
        case .trainBaseColorSensor:
            return 1 // 0: Realtime, 1: Detect
        case .trainBaseSpeedometer:
            return 0 // 0: Speed, 1: Distance
        case .LargeMotor:
            return nil
        case .XLargeMotor:
            return nil
        }
    }
}

extension IOType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .mediumMotor:
            return "Medium Motor"
        case .trainMotor:
            return "Train Motor"
        case .ledLight:
            return "LED Light"
        case .voltageSensor:
            return "Voltage Sensor"
        case .currentSensor:
            return "Current Sensor"
        case .piezoSpeaker:
            return "Piezo Speaker"
        case .rgbLight:
            return "RGB Light"
        case .tiltSensor:
            return "Tilt Sensor"
        case .motionSensor:
            return "Motion Sensor"
        case .colorAndDistanceSensor:
            return "Color & Distance Sensor"
        case .interactiveMotor:
            return "Interactive Motor"
        case .builtInMotor:
            return "Built-in Motor"
        case .builtInTiltSensor:
            return "Built-in Tilt Sensor"
        case .trainBaseMotor:
            return "Duplo Train Base Motor"
        case .trainBaseSpeaker:
            return "Duplo Train Base Speaker"
        case .trainBaseColorSensor:
            return "Duplo Train Base Color Sensor"
        case .trainBaseSpeedometer:
            return "Duplo Train Base Speedometer"
        case .LargeMotor:
            return "L Motor"
        case .XLargeMotor:
            return "XL Motor"
        }
    }
}
