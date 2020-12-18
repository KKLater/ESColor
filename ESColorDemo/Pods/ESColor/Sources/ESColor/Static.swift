//
//  Static.swift
//  
//
//  Created by 罗树新 on 2020/12/18.
//

/*
 使用该部分方式获取颜色，会有内存缓存功能，以优化多次重复生成颜色的过程。
 获取颜色过程，首先会通过相关传入的参数，生成缓存的key， 之后首先在缓存池中查找对应颜色；
 如果在缓存池中查找到了颜色，则直接返回；否则，根据参数条件，生成新的颜色，并缓存到内存中，之后返回新生成颜色。
 在 iOS 平台和 tvOS 平台，在内存警告的时候，会自动清理掉内存占用。
 在 watchOS 和 macOS 则不会主动清理内存占用。原则上不建议使用
 */
#if os(macOS)
import AppKit
#else
import Foundation
import UIKit
#if !os(watchOS)
fileprivate let _cache = AutoPurgeCache<NSString, ESUIColor>()
#endif
#endif

public extension ESUIColor {
    
    /// 根据 16 进制色值，获取颜色
    /// - Parameter value: 16 进制色值
    /// - Returns: 缓存获取的颜色或者生成的颜色
    static func color(_ value: Int) -> ESUIColor {
        return color(value, alpha: 1)
    }

    /// 根据 16 进制色值 和 透明度，获取颜色
    /// - Parameters:
    ///   - value: 16 进制色值
    ///   - alpha: 颜色的透明度
    /// - Returns: 缓存获取的颜色或者生成的颜色
    static func color(_ value: Int, alpha: CGFloat) -> ESUIColor {
        #if os(macOS) || os(watchOS)
        return ESUIColor(value, alpha: alpha)
        #else
        let formatCacheKey = "\(value)\(alpha)" as NSString
        if let color = _cache.object(forKey: formatCacheKey) as? ESUIColor {
            return color
        }
        let color = ESUIColor(value, alpha: alpha)
        _cache.setObject(color, forKey: formatCacheKey)
        return color
        #endif
    }
    
    /// 根据 16 进制字符串，获取颜色
    /// - Parameter hexString: 16进制字符串
    /// - Returns: 缓存获取的颜色或者生成的颜色
    static func color(_ hexString: String) -> ESUIColor {
        return color(hexString, alpha: 1)
    }
    
    /// 根据16 进制字符串和透明度获取颜色
    /// - Parameters:
    ///   - hexString: 16 进制字符串
    ///   - alpha: 透明度
    /// - Returns: 缓存获取的颜色或者生成的颜色
    static func color(_ hexString: String, alpha: CGFloat) -> ESUIColor {
        #if os(macOS) || os(watchOS)
        return ESUIColor(hexString, alpha: alpha)
        #else
        let formatCacheKey = "\(hexString)\(alpha)" as NSString
        if let color = _cache.object(forKey: formatCacheKey) as? ESUIColor {
            return color
        }
        let color = ESUIColor(hexString, alpha: alpha)
        _cache.setObject(color, forKey: formatCacheKey)
        return color
        #endif
    }
    
    /// 根据 red、green、blue、alpha 元组 获取颜色
    /// - Parameter RGBA: red、green、blue、alpha 元组
    /// - Returns: 缓存获取的颜色或者生成的颜色
    static func color(_ RGBA: RGBAComponents) -> ESUIColor {
        #if os(macOS) || os(watchOS)
        return ESUIColor(RGBA)
        #else
        let formatCacheKey = "\(RGBA.red)\(RGBA.green)\(RGBA.blue)\(RGBA.alpha)" as NSString
        if let color = _cache.object(forKey: formatCacheKey) as? ESUIColor {
            return color
        }
        let color = ESUIColor(RGBA)
        _cache.setObject(color, forKey: formatCacheKey)
        return color
        #endif
    }
    
    /// 根据 hue、saturation、brightness、alpha 元组获取颜色
    /// - Parameter HSBA: hue、saturation、brightness、alpha 元组
    /// - Returns: 缓存获取的颜色或者生成的颜色
    static func color(_ HSBA: HSBAComponents) -> ESUIColor {
        #if os(macOS) || os(watchOS)
        return ESUIColor(HSBA)
        #else
        let formatCacheKey = "\(HSBA.hue)\(HSBA.saturation)\(HSBA.brightness)\(HSBA.alpha)" as NSString
        if let color = _cache.object(forKey: formatCacheKey) as? ESUIColor {
            return color
        }
        let color = ESUIColor(HSBA)
        _cache.setObject(color, forKey: formatCacheKey)
        return color
        #endif
    }
    
    /// 根据 white、alpha 元组获取颜色
    /// - Parameter WA: white、alpha 元组
    /// - Returns: 缓存获取的颜色或者生成的颜色
    static func color(_ WA: WAComponents) -> ESUIColor {
        #if os(macOS) || os(watchOS)
        return ESUIColor(WA)
        #else
        let formatCacheKey = "\(WA.white)\(WA.alpha)" as NSString
        if let color = _cache.object(forKey: formatCacheKey) as? ESUIColor {
            return color
        }
        let color = ESUIColor(WA)
        _cache.setObject(color, forKey: formatCacheKey)
        return color
        #endif
    }
}
