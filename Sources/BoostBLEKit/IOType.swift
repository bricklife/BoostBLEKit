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
    case largeMotor             = 0x2e
    case extraLargeMotor        = 0x2f
    case mediumAngularMotor     = 0x30
    case largeAngularMotor      = 0x31
    case powerControlButton     = 0x37
    case colorSensor            = 0x3d
    case distanceSensor         = 0x3e
    case forceSensor            = 0x3f
    case colorLightMatrix       = 0x40
    case smallAngularMotor      = 0x41
    case mediumAngularMotorGray = 0x4b
    case largeAngularMotorGray  = 0x4c
}

extension IOType {
    
    public var canSupportMotorStartPowerCommand: Bool {
        switch self {
        case .mediumMotor, .trainMotor, .ledLight, .interactiveMotor, .builtInMotor, .trainBaseMotor, .largeMotor, .extraLargeMotor, .mediumAngularMotor, .largeAngularMotor, .smallAngularMotor, .mediumAngularMotorGray, .largeAngularMotorGray:
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
        case .largeMotor:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .extraLargeMotor:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .mediumAngularMotor:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .largeAngularMotor:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .powerControlButton:
            return nil
        case .colorSensor:
            return 0 // 0: Color
        case .distanceSensor:
            return 0 // 0: Distance (mm)
        case .forceSensor:
            return 0 // 0: Pressure (%)
        case .colorLightMatrix:
            return 2 // 0: ?, 1: ?, 2: Matrix
        case .smallAngularMotor:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .mediumAngularMotorGray:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .largeAngularMotorGray:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
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
        case .largeMotor:
            return "L Motor"
        case .extraLargeMotor:
            return "XL Motor"
        case .mediumAngularMotor:
            return "Medium Angular Motor"
        case .largeAngularMotor:
            return "Large Angular Motor"
        case .powerControlButton:
            return "Power Control Button"
        case .colorSensor:
            return "Color Sensor"
        case .distanceSensor:
            return "Distance Sensor"
        case .forceSensor:
            return "Force Sensor"
        case .colorLightMatrix:
            return "Color Light Matrix"
        case .smallAngularMotor:
            return "Small Angular Motor"
        case .mediumAngularMotorGray:
            return "Medium Angular Motor (Gray)"
        case .largeAngularMotorGray:
            return "Large Angular Motor (Gray)"
        }
    }
}
