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
    
    func testExample() {
        let color1 = UIColor("0xFFEGKD")
        let color2 = UIColor("0xffegkd")

        let color3: UIColor = .color(0xFFEE1122)
        let a = ESUIColor(0xFFEE1122).red
        print(a)
        let b = ESUIColor(0xFFEE11).brightness
        print(b)
        let _ = ESUIColor("0xFFEE11")
        if #available(iOS 13.0, tvOS 13.0, *) {
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
