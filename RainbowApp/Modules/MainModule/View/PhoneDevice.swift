//
//  PhoneDevice.swift
//  RainbowApp
//
//  Created by Николай on 18.11.2023.
//

import Foundation
import UIKit

enum DeviceModel {
    case iPhoneSE
    case other
    
    static func getDeviceSize() -> DeviceModel {
       let screenSizeHeight = UIScreen.main.bounds.size.height
        if screenSizeHeight > 750 {
            return .other
        } else {
            return .iPhoneSE
        }
    }
    static func getDeviceSizeCGFolat() -> CGFloat {
       let screenSizeHeight = UIScreen.main.bounds.size.height
        return screenSizeHeight
    }
}
