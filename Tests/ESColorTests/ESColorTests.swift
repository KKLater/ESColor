import XCTest
#if os(macOS)
import AppKit
typealias ESUIColor = NSColor
#else
import Foundation
import UIKit
typealias ESUIColor = UIColor
#endif

@testable import ESColor

final class ESColorTests: XCTestCase {
    
    @available(iOS 13.0, *)
    extension ESColor.Name {
        static let normal = Name(dynamic: 0xFF9987, dark: 0x987377)
    }

    
    


    @available(iOS 13.0, *)
    func testDynamic() {
        let color = ESUIColor(normal)
    }
    func testExample() {
        let a = ESUIColor(0xFFEE1122).red
        print(a)
        let b = ESUIColor(0xFFEE11).brightness
        print(b)
        if #available(iOS 13.0, *) {
            let c = ESUIColor(0xFF7745, 0x784334)
            print(c)
        } else {
            // Fallback on earlier versions
        }
        print("Finish")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
