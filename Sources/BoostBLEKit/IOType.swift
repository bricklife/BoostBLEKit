//
//  IOType.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 17/01/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum IOType: Equatable {
    
    case mediumMotor
    case trainMotor
    case ledLight
    case voltageSensor
    case currentSensor
    case piezoSpeaker
    case rgbLight
    case tiltSensor
    case motionSensor
    case colorAndDistanceSensor
    case interactiveMotor
    case builtInMotor
    case builtInTiltSensor
    case trainBaseMotor
    case trainBaseSpeaker
    case trainBaseColorSensor
    case trainBaseSpeedometer
    case largeMotor
    case extraLargeMotor
    case mediumAngularMotor
    case largeAngularMotor
    case powerControlButton
    case colorSensor
    case distanceSensor
    case forceSensor
    case mediumAngularMotorGray
    case largeAngularMotorGray
    case unknown(UInt8)
}

extension IOType {
    
    init(rawValue: UInt8) {
        switch rawValue {
        case 0x01:
            self = .mediumMotor
        case 0x02:
            self = .trainMotor
        case 0x08:
            self = .ledLight
        case 0x14:
            self = .voltageSensor
        case 0x15:
            self = .currentSensor
        case 0x16:
            self = .piezoSpeaker
        case 0x17:
            self = .rgbLight
        case 0x22:
            self = .tiltSensor
        case 0x23:
            self = .motionSensor
        case 0x25:
            self = .colorAndDistanceSensor
        case 0x26:
            self = .interactiveMotor
        case 0x27:
            self = .builtInMotor
        case 0x28:
            self = .builtInTiltSensor
        case 0x29:
            self = .trainBaseMotor
        case 0x2a:
            self = .trainBaseSpeaker
        case 0x2b:
            self = .trainBaseColorSensor
        case 0x2c:
            self = .trainBaseSpeedometer
        case 0x2e:
            self = .largeMotor
        case 0x2f:
            self = .extraLargeMotor
        case 0x30:
            self = .mediumAngularMotor
        case 0x31:
            self = .largeAngularMotor
        case 0x37:
            self = .powerControlButton
        case 0x3d:
            self = .colorSensor
        case 0x3e:
            self = .distanceSensor
        case 0x3f:
            self = .forceSensor
        case 0x4b:
            self = .mediumAngularMotorGray
        case 0x4c:
            self = .largeAngularMotorGray
        default:
            self = .unknown(rawValue)
        }
    }
    
    public var canSupportMotorStartPowerCommand: Bool {
        switch self {
        case .mediumMotor, .trainMotor, .ledLight, .interactiveMotor, .builtInMotor, .trainBaseMotor, .largeMotor, .extraLargeMotor, .mediumAngularMotor, .largeAngularMotor, .mediumAngularMotorGray, .largeAngularMotorGray:
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
        case .mediumAngularMotorGray:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .largeAngularMotorGray:
            return 3 // 0: ??, 1: Speed, 2: Position, 3: Absolute Position
        case .unknown:
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
        case .mediumAngularMotorGray:
            return "Medium Angular Motor (Gray)"
        case .largeAngularMotorGray:
            return "Large Angular Motor (Gray)"
        case .unknown(let ioType):
            return String(format: "Unknown IO Type (0x%02x)", ioType)
        }
    }
}
