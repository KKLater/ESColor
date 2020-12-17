//
//  Mix.swift
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
    func mix(with color: ESUIColor, amount: Float) -> ESUIColor {
        let c1 = self.RGBA
        let c2 = color.RGBA
        
        let r = mix(c1.red, c2.red, amount)
        let g = mix(c1.green, c2.green, amount)
        let b = mix(c1.blue, c2.blue, amount)
        let a = mix(c1.alpha, c2.alpha, amount)
        
        return ESUIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    private func mix(_ component1: CGFloat, _ component2: CGFloat, _ amount: Float) -> CGFloat {
        return component1 + (component2 - component1) * CGFloat(amount)
    }
}
