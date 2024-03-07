//
//  App.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

enum App: Int, CaseIterable {
    case translateNow = 0,
         traducam,
         qrScan,
         calculator,
         fontbot,
         colors,
         pixit,
         oweMe,
         h20,
         translateNowKeyboard,
         scannerAir,
         findbot
    
    var imageName: String {
        switch self {
        case .translateNow:
            return "traslatenowIcon"
        case .traducam:
            return "traducamIcon"
        case .qrScan:
            return "qrscanIcon"
        case .calculator:
            return "calculatorIcon"
        case .fontbot:
            return "fontbotIcon"
        case .colors:
            return "colorsIcon"
        case .pixit:
            return "pixitIcon"
        case .oweMe:
            return "owemeIcon"
        case .h20:
            return "h2oIcon"
        case .translateNowKeyboard:
            return "translatorKeyboardIcon"
        case .scannerAir:
            return "scannerairIcon"
        case .findbot:
            return "findbotIcon"
        }
    }
    
    var id: String {
        switch self {
        case .translateNow:
            return "1348028646"
        case .traducam:
            return "1387768529"
        case .qrScan:
            return "1226650677"
        case .calculator:
            return "1173365557"
        case .fontbot:
            return "1493429933"
        case .colors:
            return "1195677610"
        case .pixit:
            return "1489947029"
        case .oweMe:
            return "1497431529"
        case .h20:
            return "1498029069"
        case .translateNowKeyboard:
            return "1502909594"
        case .scannerAir:
            return "1490084790"
        case .findbot:
            return "1507917112"
        }
    }
    
    var appStorePath: String {
        "https://apps.apple.com/app/id\(id)"
    }
}
