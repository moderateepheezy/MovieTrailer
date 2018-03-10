//
//  Extension.swift
//  Trailer
//
//  Created by SimpuMind on 3/3/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

let primaryColor = #colorLiteral(red: 0.8588235294, green: 0.1921568627, blue: 0.4039215686, alpha: 1)

protocol MaterialView {
    func elevate(elevation: Double, shadowColor: UIColor)
}

extension UIView {
    func center(in view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func fill(_ view: UIView, offset: CGFloat = 0.0) {
        leftAnchor.align(to: view.leftAnchor, offset: offset)
        rightAnchor.align(to: view.rightAnchor, offset: offset)
        topAnchor.align(to: view.topAnchor, offset: offset)
        bottomAnchor.align(to: view.bottomAnchor, offset: offset)
    }
}
extension NSLayoutDimension {
    func align(to anchor: NSLayoutDimension, offset: CGFloat = 0.0) {
        constraint(equalTo: anchor, multiplier: 1.0, constant: offset).isActive = true
    }
    func equal(to value: CGFloat) {
        constraint(equalToConstant: value).isActive = true
    }
}
extension NSLayoutXAxisAnchor {
    func align(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0) {
        constraint(equalTo: anchor, constant: offset).isActive = true
    }
}
extension NSLayoutYAxisAnchor {
    func align(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0) {
        constraint(equalTo: anchor, constant: offset).isActive = true
    }
}

extension UITextField {
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setUnderline(color: UIColor) {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
}

extension UIView: MaterialView {
    func elevate(elevation: Double, shadowColor: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowOpacity = 1.24
        self.layer.shadowRadius = abs(CGFloat(elevation))
    }
}

