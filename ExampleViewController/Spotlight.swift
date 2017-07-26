//
//  Spotlight.swift
//  Gecco
//
//  Created by yukiasai on 2016/01/17.
//  Copyright (c) 2016 yukiasai. All rights reserved.
//

import UIKit

class Spotlight: NSObject {

    open var frame: CGRect
    public init(frame: CGRect) {
        self.frame = frame
    }
    
    public convenience init(center: CGPoint, diameter: CGFloat) {
        let frame = CGRect(x: center.x - diameter / 2, y: center.y - diameter / 2, width: diameter, height: diameter)
        self.init(frame: frame)
    }
    
    public convenience init(view: UIView, margin: CGFloat) {
        let origin = view.superview!.convert(view.frame.origin, to: view.window!.screen.fixedCoordinateSpace)
        let center = CGPoint(x: origin.x + view.bounds.width / 2, y: origin.y + view.bounds.height / 2)
        let diameter = max(view.bounds.width, view.bounds.height) + margin * 2
        self.init(center: center, diameter: diameter)
    }
    
    open var path: UIBezierPath {
        return UIBezierPath(roundedRect: frame, cornerRadius: frame.width / 2)
    }
    
    var center: CGPoint {
        return CGPoint(x: frame.midX, y: frame.midY)
    }
    
    var infinitesmalPath: UIBezierPath {
        return UIBezierPath(roundedRect: CGRect(origin: center, size: CGSize.zero), cornerRadius: 0)
    }
}
