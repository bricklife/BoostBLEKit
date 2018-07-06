//
//  Device.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 06/07/2018.
//  Copyright © 2018 bricklife.com. All rights reserved.
//

import Foundation

public protocol Device {
    
    init?(port: Port, deviceType: DeviceType)
}
