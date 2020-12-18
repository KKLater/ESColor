//
//  Dynamic.swift
//  
//
//  Created by 罗树新 on 2020/12/18.
//

#if !os(macOS) && !os(watchOS)
import Foundation
import UIKit

@available(iOS 13.0, tvOS 13.0,*)
public struct Name {
    fileprivate var dynamicColor: ESUIColor
    fileprivate var darkColor: ESUIColor

    public init(dynamic: Int, dark: Int) {
        self.init(dynamicColor: ESUIColor(dynamic), darkColor: ESUIColor(dark))
    }
    
    public init(_ value: Int) {
        self.init(dynamic: value, dark: value)
    }
    
    public init(dynamicColor: ESUIColor, darkColor: ESUIColor) {
        self.dynamicColor = dynamicColor
        self.darkColor = darkColor
    }
}

@available(iOS 13.0, tvOS 13.0,*)
public extension ESUIColor {
    
    convenience init(_ dynamic: Int, _ dark: Int) {
        if dynamic == dark {
            self.init(dynamic)
        }
        self.init { $0.userInterfaceStyle == .dark ? ESUIColor(dark) : ESUIColor(dynamic) }
    }
    
    convenience init(_ name: ESColor.Name) {
        self.init { $0.userInterfaceStyle == .dark ? name.dynamicColor : name.darkColor }

    }
    
    
    
    
}



#endif
