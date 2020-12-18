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
    
    typealias ColorComponents = RGBAComponents
    
    /// red、green、blue、alpha 元组
    var RGBA: RGBAComponents {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGBAComponents(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// hue、saturation、birghtness、alpha 元组
    var HSBA: HSBAComponents {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return HSBAComponents(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    /// white、alpha 元组
    var WA: WAComponents {
        var white: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getWhite(&white, alpha: &alpha)
        return WAComponents(white: white, alpha: alpha)
    }

    // MARK:- component of color components

    /// 根据 red、green、blue、alpha 元组创建颜色
    /// - Parameter RGBA: red、green、blue、alpha 元组
    convenience init(_ RGBA: RGBAComponents) {
        self.init(red: RGBA.red, green: RGBA.green, blue: RGBA.blue, alpha: RGBA.alpha)
    }
    
    /// 根据 hue、saturation、brightness、alpha 元组创建颜色
    /// - Parameter HSBA: hue、saturation、brightness、alpha 元组
    convenience init(_ HSBA: HSBAComponents) {
        self.init(hue: HSBA.hue, saturation: HSBA.saturation, brightness: HSBA.saturation, alpha: HSBA.alpha)
    }
    
    /// 根据 white、alpha 元组创建颜色
    /// - Parameter WA: white、alpha 元组
    convenience init(_ WA: WAComponents) {
        self.init(white: WA.white, alpha: WA.alpha)
    }
    
    // MARK:- Red/Green/Blue/Alpha
    
    /// 获取颜色三原色红色值 0.0 ~ 1.0
    var red: CGFloat { RGBA.red }
    
    /// 获取颜色三原色绿色值 0.0 ~ 1.0
    var green: CGFloat { RGBA.green }
    
    /// 获取颜色三原色蓝色值 0.0 ~ 1.0
    var blue: CGFloat { RGBA.blue }
    
    /// 获取颜色透明度值 0.0 ~ 1.0
    var alpha: CGFloat { RGBA.alpha }
    
    /// 修改颜色的三原色和透明度
    /// - Parameters:
    ///   - red: 三原色红色通道值
    ///   - green: 三原色绿色通道值
    ///   - blue: 三原色蓝色 通道值
    ///   - alpha: 透明度 通道值
    /// - Returns: 修改后的颜色（如果个通道均没有设置参数，则不做修改，返回原颜色）
    func setRed(_ red: CGFloat? = nil, green: CGFloat? = nil, blue: CGFloat? = nil, alpha: CGFloat? = nil) -> ESUIColor {
        if red == nil, green == nil, blue == nil, alpha == nil { return self }
        
        return ESUIColor(red: red ?? RGBA.red, green: green ?? RGBA.green, blue: blue ?? RGBA.blue, alpha: alpha ?? HSBA.alpha)
    }
    
    
    // MARK:- Hue/Saturation/Brightness/Alpha
    
    /// 获取颜色色调，0.0 ~ 1.0
    var hue: CGFloat { HSBA.hue }
    
    /// 获取颜色饱和度，0.0 ~ 1.0
    var saturation: CGFloat { HSBA.saturation }
    
    /// 获取颜色亮度，0.0 ~ 1.0
    var brightness: CGFloat { HSBA.brightness }
    
    /// 修改颜色色调、饱和度、亮度和透明度，以获取新的颜色
    /// - Parameters:
    ///   - hue: 色调
    ///   - saturation: 饱和度
    ///   - brightness: 亮度
    ///   - alpha: 透明度
    /// - Returns: 修改色调、饱和度、亮度、透明度后的颜色，如果都未设置，则返回原颜色
    func setHue(_ hue: CGFloat? = nil, saturation: CGFloat? = nil, brightness: CGFloat? = nil, alpha: CGFloat? = nil) -> ESUIColor {
        if hue == nil, saturation == nil, brightness == nil, alpha == nil { return self }
        
        return ESUIColor(hue: hue ?? HSBA.hue, saturation: saturation ?? HSBA.saturation, brightness: brightness ?? HSBA.brightness, alpha: alpha ?? HSBA.alpha)
    }

    // MARK:- White/Alpha
    
    /// 白色色值
    var white: CGFloat { WA.white }
    
    /// 修改白色色值和透明度
    /// - Parameters:
    ///   - white: 白色色值
    ///   - alpha: 透明度
    /// - Returns: 修改白色色值和透明度后的颜色，如果未设置，则返回原颜色
    func setWhite(_ white: CGFloat? = nil, alpha: CGFloat? = nil) -> ESUIColor {
        if white == nil, alpha == nil { return self }
        return ESUIColor(white: white ?? WA.white, alpha: alpha ?? WA.alpha)
    }
}


