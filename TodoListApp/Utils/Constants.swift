/*
 * Constants.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Jan 3, 2018
 * Description:
 *              Class with Constant values to maintain order and avoid errors in the project
 * Version: 0.2
 */

import Foundation
import UIKit

struct Constants {
    
    struct HexStringColor {
        static let DisabledText = "0xE1E2E1"  //0xD0D0D0
        static let TaskNameText = TextOnSecondary
        
        static let PalletePrimary = "0xDD2C00"
        static let PalleteSecondary = "0xFFFFFF"
        static let PalleteDark = "0xA30000"
        static let PalleteLight = "0xFF3464"
        
        static let TextOnPrimary = "0xFFFFFF"
        static let TextOnSecondary = "0x616161"
    }
    
    struct Color {
        static let tintColorForNavigationBar = UIColor(red: Utils.rgbHexaComponentToDecimal("DD"),
                                                green: Utils.rgbHexaComponentToDecimal("2D"),
                                                blue: Utils.rgbHexaComponentToDecimal("01"), alpha: 1)
        
        static let disabledColorForName = UIColor(red: Utils.rgbHexaComponentToDecimal("A1"),
                                           green: Utils.rgbHexaComponentToDecimal("A2"),
                                           blue: Utils.rgbHexaComponentToDecimal("A1"), alpha: 1)
        
        static let enabledColorForName = UIColor(red: Utils.rgbHexaComponentToDecimal("41"),
                                          green: Utils.rgbHexaComponentToDecimal("41"),
                                          blue: Utils.rgbHexaComponentToDecimal("41"), alpha: 1)
        
        static let enabledColorForEditButtonText = UIColor(red: Utils.rgbHexaComponentToDecimal("A0"),
                                                    green: Utils.rgbHexaComponentToDecimal("00"),
                                                    blue: Utils.rgbHexaComponentToDecimal("00"), alpha: 1)
        
    }
    
    struct Text {
        static let ActiveTask = "Active Task"
        static let CompletedTask = "Completed Task"
        static let DescriptionPlaceHolder = "Enter a description ..."
        static let EditTaskSegueIdentifier = "EditScreenSegue"
        static let UserDefaultsStorageKey = "tasks"
    }
    
}
