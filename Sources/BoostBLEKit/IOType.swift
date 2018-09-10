//
//  IOType.swift
//  BoostBLEKit
//
//  Created by ooba on 17/01/2018.
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
}

extension IOType {
    
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
            return 0
        case .tiltSensor:
            return 1
        case .motionSensor:
            return 0
        case .colorAndDistanceSensor:
            return 8
        case .interactiveMotor:
            return 2
        case .builtInMotor:
            return 2
        case .builtInTiltSensor:
            return 1
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
        }
    }
}
