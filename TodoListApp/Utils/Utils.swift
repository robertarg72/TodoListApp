/*
 * Utils.swift
 * Project: Assignment 2 - Todo List App
 * Students:
 *              Ling Bao        300901785
 *              Robert Argume   300949529
 * Date: Dec 20, 2017
 * Description:
 *              Class with useful static functions to share in the project
 * Version: 0.1
 */
import Foundation
import UIKit

class Utils {
    
    // This function convert a RGB component to standarized CG value
    public static func rgbHexaComponentToDecimal(_ hexa:String) -> CGFloat{
        if let decimal = UInt8(hexa, radix: 16) {
            return CGFloat(decimal) / 255.0
        }
        return 0
    }
}
