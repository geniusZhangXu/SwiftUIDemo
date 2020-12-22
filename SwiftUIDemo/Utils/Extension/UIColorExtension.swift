//
//  UIColorExtension.swift
//  WisdomFN
//
//  Created by Zhangxu on 2020/7/16.
//  Copyright © 2020 Zhangxu. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// int init with color
    ///
    /// - Parameters:
    ///   - r: red
    ///   - g: green
    ///   - b: blue
    ///   - a: alpha
    convenience init(r:UInt32 ,g:UInt32 , b:UInt32 , a:CGFloat = 1.0) {
        self.init(red:   CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue:  CGFloat(b) / 255.0,
                  alpha: a)
    }
    
    /// hex init with color
    ///
    /// - Parameters:
    ///   - hexString: 6 bits eg: 'F1F1F1'
    ///   - alpha: 0.0-1.0
    convenience init(hexString: String, alpha:CGFloat = 1.0) {
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cString.count < 6 {
            self.init(red: CGFloat(r)   / 255.0,
                      green: CGFloat(g) / 255.0,
                      blue: CGFloat(b)  / 255.0,
                      alpha: alpha)
            return
        }
        
        let index = cString.index(cString.endIndex, offsetBy: -6)
        let subString = cString[index...]
        if cString.hasPrefix("0X") { cString = String(subString) }
        if cString.hasPrefix("#") { cString = String(subString) }
        
        if cString.count != 6 {
            self.init(red: CGFloat(r)   / 255.0,
                      green: CGFloat(g) / 255.0,
                      blue: CGFloat(b)  / 255.0,
                      alpha: alpha)
            return
        }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        self.init(red: CGFloat(r)   / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b)  / 255.0,
                  alpha: alpha)
    }
}

