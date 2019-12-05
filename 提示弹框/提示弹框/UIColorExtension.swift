//
//  ColorCategory.swift
//  AnTuTravel
//
//  Created by 刘伟 on 2019/7/17.
//  Copyright © 2019 GCET. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(hexString:String) {
        self.init(hexString:hexString, alpha:1)
    }
    
    convenience init(hexString:String, alpha:CGFloat) {
                        
        var fixColorString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if fixColorString.count < 6 || fixColorString.count > 8 {
            self.init(white: 1, alpha: 1)
            return
        }
        
        if fixColorString.hasPrefix("#") {
            fixColorString = (fixColorString as NSString).substring(from: 1)
        }
        
        if fixColorString.hasPrefix("0x") {
            fixColorString = (fixColorString as NSString).substring(from: 2)
        }
        
        var colorRange = NSMakeRange(0, 2)
        let redString = (fixColorString as NSString).substring(with: colorRange)
        
        colorRange.location = 2
        let greenString = (fixColorString as NSString).substring(with: colorRange)
        
        colorRange.location = 4
        let blueString = (fixColorString as NSString).substring(with: colorRange)
        
        var redValue:UInt64 = 0, greenValue:UInt64 = 0, blueValue:UInt64 = 0
        
        Scanner(string: redString).scanHexInt64(&redValue)
        Scanner(string: greenString).scanHexInt64(&greenValue)
        Scanner(string: blueString).scanHexInt64(&blueValue)

        self.init(red: CGFloat(redValue)/255.0, green: CGFloat(greenValue)/255.0, blue: CGFloat(blueValue)/255.0, alpha: 1)
    }
}

func HexColor(hexString:String) -> UIColor {
    return UIColor.init(hexString: hexString)
}

func AlphaHexColor(hexString:String, alpha:CGFloat) -> UIColor {
    return UIColor.init(hexString: hexString, alpha: alpha)
}
