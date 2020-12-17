//
//  Components.swift
//
//
//  Created by 罗树新 on 2020/12/17.
//

#if os(macOS)
import AppKit
public typealias ESUIColor = NSColor
#else
import Foundation
import UIKit
public typealias ESUIColor = UIColor
#endif


public extension ESUIColor {
    
    typealias ColorComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    
    convenience init(_ value: Int) {
        let hexStr = ESUIColor.hexString(for: value)
        let alpha = ESUIColor.alpha(for: hexStr)
        let formatHexString = ESUIColor.formatHexString(hexStr)
        let components = ESUIColor.colorComponents(formatHexString)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha)
    }
    
    convenience init(_ value: Int, alpha: CGFloat) {
        let hexStr = ESUIColor.hexString(for: value)
        let formatHexString = ESUIColor.formatHexString(hexStr)
        let components = ESUIColor.colorComponents(formatHexString)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha)
    }
    
    convenience init(_ components: ColorComponents) {
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }
}

private extension ESUIColor {
    
    static func colorComponents(_ string: String) -> ColorComponents {
        let alpha = ESUIColor.alpha(for: string)
        
        var rgbString = string
        if string.count == 3 {
            /// FDE
            rgbString = ""
            
            // F
            let r = String(string.prefix(1))
            rgbString += r    // rgb = F
            rgbString += r    // rgb = FF
            
            // D
            let g = String(string[string.index(string.startIndex, offsetBy: 1)])
            rgbString += g    // rgb = FFD
            rgbString += g    // rgb = FFDD
            
            // E
            let b = String(string.suffix(1))
            rgbString += b    // rgb = FFDDE
            rgbString += b    // rgb = FFDDEE
        }
        
        let rStr = String(rgbString.prefix(2))
        let rHex = hex(rStr)
        let rFloat = CGFloat(rHex) / 255.0
        
        let gStartIndex = rgbString.index(rgbString.startIndex, offsetBy: 2)
        let gEndIndex = rgbString.index(rgbString.startIndex, offsetBy: 4)
        let gStr = String(rgbString[gStartIndex..<gEndIndex])
        
        let gHex = hex(gStr)
        let gFloat = CGFloat(gHex) / 255.0
        
        let bStr = String(rgbString.suffix(2))
        let bHex = hex(bStr)
        let bFloat = CGFloat(bHex) / 255.0
        return (rFloat, gFloat, bFloat, alpha)
    }
    
    static func color(with rgbString: String, alpha: CGFloat) -> ESUIColor {
        let rStr = String(rgbString.prefix(2))
        let rHex = hex(rStr)
        let rFloat = CGFloat(rHex) / 255.0
        
        let gStartIndex = rgbString.index(rgbString.startIndex, offsetBy: 2)
        let gEndIndex = rgbString.index(rgbString.startIndex, offsetBy: 4)
        let gStr = String(rgbString[gStartIndex..<gEndIndex])
        
        let gHex = hex(gStr)
        let gFloat = CGFloat(gHex) / 255.0
        
        let bStr = String(rgbString.suffix(2))
        let bHex = hex(bStr)
        let bFloat = CGFloat(bHex) / 255.0
        
        let color = ESUIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: alpha)
        return color
        
    }
    
    static func alpha(for hexStr: String) -> CGFloat {
        var alphaHexStr: String = ""
        
        if hexStr.count == 4 {
            /// FFFF
            alphaHexStr = String(hexStr[hexStr.startIndex])
        } else if hexStr.count == 8 {
            /// FFFFFFFF
            alphaHexStr = String(hexStr[hexStr.index(hexStr.startIndex, offsetBy: String.IndexDistance.init(2))])
        }
        
        if alphaHexStr.count == 1 {
            alphaHexStr += alphaHexStr
        }
        
        let alphaInt = hex(alphaHexStr)
        let alpha = CGFloat(alphaInt) / 255.0
        return alpha != 0 ? alpha :  1
    }
    
    static func formatHexString(_ hexString: String) -> String {
        var formatHexString = hexString
        if hexString.count == 4 || hexString.count == 8 {
            /// FFFFFFFF
            let count = hexString.count == 8 ? 6 : 3
            formatHexString = String(hexString.suffix(count))
        }
        
        if formatHexString.count == 3 {
            /// FDE
            var tFormatHexString = ""
            
            // F
            let r = String(formatHexString.prefix(1))
            tFormatHexString += r    // rgb = F
            tFormatHexString += r    // rgb = FF
            
            // D
            let g = String(formatHexString[formatHexString.index(formatHexString.startIndex, offsetBy: 1)])
            tFormatHexString += g    // rgb = FFD
            tFormatHexString += g    // rgb = FFDD
            
            // E
            let b = String(formatHexString.suffix(1))
            tFormatHexString += b    // rgb = FFDDE
            tFormatHexString += b    // rgb = FFDDEE
            
            formatHexString = tFormatHexString
        }
        
        return formatHexString
    }
    
    static func getColorComponents(_ value: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        let r = CGFloat(value >> 16 & 0xFF) / 255.0
        let g = CGFloat(value >> 8 & 0xFF) / 255.0
        let b = CGFloat(value & 0xFF) / 255.0
        
        return (red: r, green: g, blue: b)
    }
    
    static func hex(_ str: String) -> Int {
        let string = "0x" + str
        let scanner = Scanner(string: string)
        var hexNum: UInt32 = 0
        scanner.scanHexInt32(&hexNum)
        return Int(hexNum)
    }
    
    static func hexString(for value: Int) -> String {
        var nLetterValue: String
        
        var str: String = ""
        var ttmpig: Int
        var tmpid = value
        for _ in 0..<9 {
            ttmpig = tmpid % 16
            tmpid = tmpid / 16
            switch ttmpig {
            case 10:
                nLetterValue = "A"
            case 11:
                nLetterValue = "B"
            case 12:
                nLetterValue = "C"
            case 13:
                nLetterValue = "D"
            case 14:
                nLetterValue = "E"
            case 15:
                nLetterValue = "F"
            default:
                nLetterValue = String(ttmpig)
            }
            
            str = nLetterValue.appending(str)
            if (tmpid == 0) {
                break;
            }
        }
        return str
    }
    
    static func alpha(for value: Int) -> CGFloat {
        let hexStr = hexString(for: value)
        guard valid(hexStr) == true else {
            return 0.0
        }
        
        return 0.0
    }
    
    static func valid(_ hex: String) -> Bool {
        
        /// 检查是否符合 “FFF"、”FFFF“、”FFFFFF“、”FFFFFFFF“，否则不支持
        let validHexCount = [3, 4, 6, 8]
        if validHexCount.contains(hex.count) {
            return true
        }
        return false
    }
}
