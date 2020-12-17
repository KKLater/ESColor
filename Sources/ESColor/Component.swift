//
//  Components.swift
//  
//
//  Created by 罗树新 on 2020/12/17.
//

#if os(macOS)
import AppKit
#else
import Foundation
import UIKit
#endif

public extension ESUIColor {
    
    // MARK: - Components
    typealias RGBAComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    
    typealias HSBAComponents = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
    
    typealias WAComponents = (white: CGFloat, alpha: CGFloat)
    
    var RGBA: RGBAComponents {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGBAComponents(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var HSBA: HSBAComponents {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return HSBAComponents(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    var WA: WAComponents {
        var white: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getWhite(&white, alpha: &alpha)
        return WAComponents(white: white, alpha: alpha)
    }

    // MARK:- component of color components
    // MARK:- Red/Green/Blue/Alpha

    var red: CGFloat { RGBA.red }
    
    var green: CGFloat { RGBA.green }
    
    var blue: CGFloat { RGBA.blue }
    
    var alpha: CGFloat { RGBA.alpha }

    convenience init(RGBA: RGBAComponents) {
        self.init(red: RGBA.red, green: RGBA.green, blue: RGBA.blue, alpha: RGBA.alpha)
    }
    
    convenience init(HSBA: HSBAComponents) {
        self.init(hue: HSBA.hue, saturation: HSBA.saturation, brightness: HSBA.saturation, alpha: HSBA.alpha)
    }
    
    convenience init(WA: WAComponents) {
        self.init(white: WA.white, alpha: WA.alpha)
    }
    
    func setRed(_ red: CGFloat? = nil, green: CGFloat? = nil, blue: CGFloat? = nil, alpha: CGFloat? = nil) -> ESUIColor {
        if red == nil, green == nil, blue == nil, alpha == nil { return self }
        
        return ESUIColor(red: red ?? RGBA.red, green: green ?? RGBA.green, blue: blue ?? RGBA.blue, alpha: alpha ?? HSBA.alpha)
    }
    
    
    // MARK:- Hue/Saturation/Brightness/Alpha
    
    var hue: CGFloat { HSBA.hue }
    
    var saturation: CGFloat { HSBA.saturation }
    
    var brightness: CGFloat { HSBA.brightness }
  
    func setHue(_ hue: CGFloat? = nil, saturation: CGFloat? = nil, brightness: CGFloat? = nil, alpha: CGFloat? = nil) -> ESUIColor {
        if hue == nil, saturation == nil, brightness == nil, alpha == nil { return self }
        
        return ESUIColor(hue: hue ?? HSBA.hue, saturation: saturation ?? HSBA.saturation, brightness: brightness ?? HSBA.brightness, alpha: alpha ?? HSBA.alpha)
    }

    // MARK:- White/Alpha
    
    var white: CGFloat { WA.white }
    
    func setWhite(_ white: CGFloat? = nil, alpha: CGFloat? = nil) -> ESUIColor {
        if white == nil, alpha == nil { return self }
        return ESUIColor(white: white ?? WA.white, alpha: alpha ?? WA.alpha)
    }
}


