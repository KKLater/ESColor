//
//  ViewController.swift
//  ESColorDemo-spm
//
//  Created by 罗树新 on 2020/12/19.
//


import UIKit
import ESColor

extension Name {
    static let normal = Name(dynamic: 0x989988, dark: 0x929833)
    static let dwColor = Name(dynamicColor: UIColor.darkGray, darkColor: UIColor.white)
    static let C889988 = Name(0x889988)
}
class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color1 = UIColor(0x788833)
        let color2 = UIColor(0xFFFFFF, 0x000000)
        let color3 = UIColor(.normal)
        let color4 = UIColor(Name(0xFFFFFF))
        let color5 = UIColor(Name(dynamicColor: .red, darkColor: .green))
        
        print(color1, color2, color3, color4)

        let color6 = UIColor.random()
        print(color6)
        
        let _ = UIColor("0xFFEGKD")

        let _ = UIColor.color("0xFFEGKD")
        
        let _ = UIColor.color("0xFFEGKD")
        
        let view1 = UIView(frame: CGRect(x: 10, y: 100, width: 80, height: 80))
        view1.backgroundColor = color1
        view.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        view2.backgroundColor = color2
        view.addSubview(view2)
        
        let view3 = UIView(frame: CGRect(x: 200, y: 100, width: 80, height: 80))
        view3.backgroundColor = color3
        view.addSubview(view3)
        
        let view4 = UIView(frame: CGRect(x: 10, y: 200, width: 80, height: 80))
        view4.backgroundColor = color4
        view.addSubview(view4)
        
        let view5 = UIView(frame: CGRect(x: 100, y: 200, width: 80, height: 80))
        view5.backgroundColor = color5
        view.addSubview(view5)
        
        let view6 = UIView(frame: CGRect(x: 200, y: 200, width: 80, height: 80))
        view6.backgroundColor = color6
        view.addSubview(view6)
        
        let red = color1.red
        let green = color1.green
        let blue = color1.blue
        let alpha = color1.alpha
        let hue = color1.hue
        let saturation = color1.saturation
        let brightness = color1.brightness
        let white = color1.white
        print(red, green, blue, alpha, hue, saturation, brightness, white)

        startAnimation(view: view1, c1: color1, c2: color2, i: 0)
        }
        



    func startAnimation(view: UIView, c1: UIColor, c2: UIColor, i: Int) {
        var progress = i
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            progress += 1
            let amount = Float(progress) / 50
            let mixColor = c1.mix(with: c2, amount: amount)
            view.backgroundColor = mixColor
            if progress < 50 {
                self.startAnimation(view: view, c1: c1, c2: c2, i: progress)
            }
        }
    }


}

