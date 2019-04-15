//
//  extension+UIKit.swift
//
//  Created by 姚晨峰 on 2019/4/11.
//  Copyright © 2019 jyc99. All rights reserved.
//

import Foundation
extension UIColor {
    public func createImageWithColor() -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    convenience init(hex: String) {
        let charSet: CharacterSet = CharacterSet.init(charactersIn: "# ")
        let hexStr = hex.trimmingCharacters(in: charSet)
        let scanner = Scanner(string: hexStr)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff

        self.init(
            red: CGFloat(red) / 0xff,
            green: CGFloat(green) / 0xff,
            blue: CGFloat(blue) / 0xff, alpha: 1
        )
    }
    static func gradualChangingColor(view: UIView, frame: CGRect, fromHexColorStr: String, toHexColorStr: String) -> CAGradientLayer? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        let gradientColors: [CGColor] = [UIColor.init(hex: fromHexColorStr).cgColor, UIColor.init(hex: toHexColorStr).cgColor]
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
        let gradientLocations: [NSNumber] = [0.0, 1.0]
        gradientLayer.locations = gradientLocations
        return gradientLayer
    }
}
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0 ? true:false
        }
    }
    //边框颜色
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.white.cgColor)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    //设置边框宽度
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    var viewController: UIViewController? {
        var next: UIView? = self
        repeat {
            if let viewc = next?.next as? UIViewController {
                return viewc
            }
            next = next?.superview

        }while next != nil
        return nil
    }
    func addSubview(_ views: [UIView]) {
        for subv in views {
            addSubview(subv)
        }
    }
}
extension URL {
    var schemehostpath: String {
        return "\(self.scheme ?? "")://\(self.host ?? "")\(self.path)"
    }
}
