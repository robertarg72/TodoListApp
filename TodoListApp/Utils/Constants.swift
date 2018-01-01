/*
 * Constants.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Dec 20, 2017
 * Description:
 *              Class with Constant values to maintain order and avoid errors in the project
 * Version: 0.1
 */

import Foundation

struct Constants {
    
    struct Color {
        static let DisabledText = "0xE1E2E1"  //0xD0D0D0
        static let TaskNameText = TextOnSecondary
        
        static let PalletePrimary = "0xDD2C00"
        static let PalleteSecondary = "0xFFFFFF"
        static let PalleteDark = "0xA30000"
        static let PalleteLight = "0xFF3464"
        
        static let TextOnPrimary = "0xFFFFFF"
        static let TextOnSecondary = "0x616161"
    }
    
    struct Text {
        static let ActiveTask = "Active Task"
        static let CompletedTask = "Completed Task"
        static let DescriptionPlaceHolder = "Enter a description ..."
        static let EditTaskSegueIdentifier = "EditScreenSegue"
    }
}
