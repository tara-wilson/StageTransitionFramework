//
//  Extensions.swift
//  ExampleViewController
//
//  Created by Tara Wilson on 7/20/17.
//  Copyright © 2017 twil. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(forTitleLabel: Bool) {
        self.init(forGenericLabel: true)
        self.numberOfLines = 2
        self.adjustsFontSizeToFitWidth = true
        self.font = UIFont.boldMusique(withSize: 25)
    }
    
    convenience init(forGenericLabel: Bool) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.font = UIFont.musique(withSize: 14)
        self.textColor = UIColor.white
    }
    
}


extension UIButton {
    
    convenience init(genericButton: Bool) {
        self.init()
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor().darkBlue()
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.clear.cgColor
        self.titleLabel?.font = UIFont.boldMusique(withSize: 14)
    }
    
}

extension UIView {
    
    func addGenericConstraints(item: AnyObject, top: CGFloat?, left: CGFloat?, right: CGFloat?, bottom: CGFloat?) {
        if let top = top {
            self.addConstraint(NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: top))
        }
        if let left = left {
            self.addConstraint(NSLayoutConstraint(item: item, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: left))
        }
        if let right = right {
            self.addConstraint(NSLayoutConstraint(item: item, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: right))
        }
        if let bottom = bottom {
            self.addConstraint(NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: bottom))
        }
    }
    
    func addRelationtionalConstraints(itemOne: AnyObject, itemTwo: AnyObject, extraSpace: CGFloat = 0, lessSpace: CGFloat = 0, height: CGFloat? = nil) {
        let padding: CGFloat = 20
        itemOne.setAlpha(0)
        self.addConstraint(NSLayoutConstraint(item: itemOne, attribute: .top, relatedBy: .equal, toItem: itemTwo, attribute: .bottom, multiplier: 1, constant: 5 + extraSpace))
        self.addConstraint(NSLayoutConstraint(item: itemOne, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: padding))
        self.addConstraint(NSLayoutConstraint(item: itemOne, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -padding - lessSpace))
        if let height = height {
            self.addConstraint(NSLayoutConstraint(item: itemOne, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height))
        }
    }
    
    func addRightImageConstraints(itemOne: AnyObject, itemTwo: AnyObject, height: CGFloat) {
        self.addConstraints([
            NSLayoutConstraint(item: itemOne, attribute: .top, relatedBy: .equal, toItem: itemTwo, attribute: .bottom, multiplier: 1, constant: height/2),
            NSLayoutConstraint(item: itemOne, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -2*height),
            NSLayoutConstraint(item: itemOne, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -height),
            NSLayoutConstraint(item: itemOne, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
            ])
        
    }
    
    func addConstraintsWithEqualHeightandWidth(itemOne: AnyObject, itemTwo: AnyObject, height: CGFloat, extraLeading: CGFloat) {
        self.addConstraints([
            NSLayoutConstraint(item: itemOne, attribute: .top, relatedBy: .equal, toItem: itemTwo, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: itemOne, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20 + extraLeading),
            NSLayoutConstraint(item: itemOne, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height),
            NSLayoutConstraint(item: itemOne, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
            ])
    }
    
}

///some helpful extensions so you can see what's going on here
extension UIFont {
    
    public class func musique(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size)!
    }
    
    public class func boldMusique(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size)!
    }
    
}

extension UIColor {
    
    func darkBlue() -> UIColor {
        return UIColor(red: 104/255, green: 106/255, blue: 241/255, alpha: 1)
    }
    
}

extension UIImageView
{
    convenience init(getBlurImage: Bool, image: UIImage?) {
        self.init()
        if let image = image {
            self.image = image
        }
        if getBlurImage {
            self.addBlurEffect()
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
    }
    
}

extension String
{
    func parseForYoutube() -> String {
        let newstring = self.replacingOccurrences(of: "&list", with: "")
        var vars = newstring.characters.split(separator: "=").map(String.init)
        if vars.count < 2 {
            vars = self.characters.split(separator: "/").map(String.init)
            if vars.count > 2 {
                return vars[2]
            }
        } else {
            return vars[1]
        }
        return ""
    }
    
    func parseForLink() -> String {
        return self.components(separatedBy: " ").last ?? self
    }
}
