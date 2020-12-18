//
//  Random.swift
//  
//
//  Created by 罗树新 on 2020/12/18.
//

#if os(macOS)
import AppKit
#else
import Foundation
import UIKit
#endif

public extension ESUIColor {
    
    /// 随机颜色
    static func random() -> ESUIColor {
        let color: ESUIColor = ESUIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0);
        return color
    }
}
