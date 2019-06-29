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
    case poweredUp
    case duploTrain
}

public extension HubType {
    
    init?(manufacturerData: Data) {
        guard manufacturerData.count > 3 else { return nil }
        
        switch manufacturerData[3] {
        case 0x40:
            self = .boost
        case 0x41:
            self = .poweredUp
        case 0x20:
            self = .duploTrain
        default:
            return nil
        }
    }
}

extension HubType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .boost:
            return "Boost Move Hub"
        case .poweredUp:
            return "Powered Up Smart Hub"
        case .duploTrain:
            return "Duplo Train Base"
        }
    }
}

