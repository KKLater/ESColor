//
//  Dynamic.swift
//  
//
//  Created by 罗树新 on 2020/12/18.
//

#if os(macOS)
import AppKit
#else
import Foundation
import UIKit

@available(iOS 13.0, *)
public struct Name {
    fileprivate var dynamic: Int
    fileprivate var dark: Int

    public init(dynamic: Int, dark: Int) {
        self.dynamic = dynamic
        self.dark = dark
    }
    
    public init(_ value: Int) {
        self.dynamic = value
        self.dark = value
    }
}

@available(iOS 13.0, *)
public extension ESUIColor {
    
 

    convenience init(_ dynamic: Int, _ dark: Int) {
        if dynamic == dark {
            self.init(dynamic)
        }
        self.init { $0.userInterfaceStyle == .dark ? ESUIColor(dark) : ESUIColor(dynamic) }
    }
    
    convenience init(_ name: ESColor.Name) {
        self.init(name.dynamic, name.dark)
    }
    
    
    
    
}



#endif
