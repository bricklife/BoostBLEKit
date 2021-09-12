//
//  HubType.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 20/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public enum HubType {
    
    case boost
    case boostV1
    case poweredUp
    case remoteControl
    case mario
    case luigi
    case duploTrain
    case controlPlus
    case spikeEssential
}

public extension HubType {
    
    init?(manufacturerData: Data) {
        guard manufacturerData.count > 3 else { return nil }
        
        switch manufacturerData[3] {
        case 0x40:
            if manufacturerData[6] & 0x02 > 0 {
                self = .boost
            } else {
                self = .boostV1
            }
        case 0x41:
            self = .poweredUp
        case 0x42:
            self = .remoteControl
        case 0x43:
            self = .mario
        case 0x44:
            self = .luigi
        case 0x20:
            self = .duploTrain
        case 0x80:
            self = .controlPlus
        case 0x83:
            self = .spikeEssential
        default:
            return nil
        }
    }
}

extension HubType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .boost:
            return "BOOST Move Hub"
        case .boostV1:
            return "BOOST Move Hub (F/W 1.x)"
        case .poweredUp:
            return "Powered Up Smart Hub"
        case .remoteControl:
            return "Powered Up Remote Control"
        case .mario:
            return "Mario"
        case .luigi:
            return "Luigi"
        case .duploTrain:
            return "Duplo Train Base"
        case .controlPlus:
            return "CONTROL+ Smart Hub"
        case .spikeEssential:
            return "SPIKE Essential Hub"
        }
    }
}

