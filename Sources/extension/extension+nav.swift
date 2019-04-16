//
//  extension+nav.swift
//  beeApp
//
//  Created by 姚晨峰 on 2019/4/15.
//  Copyright © 2019 jyc99. All rights reserved.
//

import Foundation
extension UINavigationBar {

    /// 设置导航背景色
    ///
    /// - Parameter color: nil时背景透明
    func jycsetBackColor(_ color: UIColor? = nil) {
        let backImg: UIImage = color?.createImageWithColor() ?? UIImage()
        if color != nil {
            setBackgroundImage(backImg, for: .default)
        } else {
            setBackgroundImage(backImg, for: .default)
            self.shadowImage = backImg
        }
    }
    func jycsetBackColor(gradient colors: [UIColor]) {
        var frameAndStatusBar: CGRect = self.bounds
        frameAndStatusBar.size.height += 20 // add 20 to account for the status bar
        setBackgroundImage(UINavigationBar.gradient(size: frameAndStatusBar.size, colors: colors), for: .default)
    }

    /// Creates a gradient image with the given settings
    static func gradient(size: CGSize, colors: [UIColor]) -> UIImage? {
        // Turn the colors into CGColors
        let cgcolors = colors.map { $0.cgColor }

        // Begin the graphics context
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)

        // If no context was retrieved, then it failed
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        // From now on, the context gets ended if any return happens
        defer { UIGraphicsEndImageContext() }

        // Create the Coregraphics gradient
        var locations: [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgcolors as NSArray as CFArray, locations: &locations) else { return nil }

        // Draw the gradient
        context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: size.width, y: 0.0), options: [])

        // Generate the image (the defer takes care of closing the context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

}
