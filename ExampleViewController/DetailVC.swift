
//
//  DetailVC.swift
//  musique
//
//  Created by Tara Wilson on 6/23/17.
//  Copyright © 2017 twil. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import StageTransition

let padding: CGFloat = 20

class DetailVC: UIViewController {
    
    var backgroundImage: UIImage?
    
    var spotlightView: (UIView?, CAShapeLayer?)
    var spotlightViewTwo: (UIView?, CAShapeLayer?)
    
    var startImage: UIImageView!
    
    var imgtop: NSLayoutConstraint!
    var imgleft: NSLayoutConstraint!
    var imgright: NSLayoutConstraint!
    
    var stage: UIImageView!
    var curtainOne: UIView!
    var curtainTwo: UIView!
    
    var stageTop: NSLayoutConstraint!
    var curtainOneRight: NSLayoutConstraint!
    var curtainTwoLeft: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
    }
    
    func createView() {
        setBackgroundImage()
        setUpCloseButton()
        view.layoutIfNeeded()
    }
    
    init(image: UIImage, frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.white
        startImage = UIImageView(image: image)
        startImage.contentMode = .scaleAspectFill
        startImage.clipsToBounds = true
        startImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startImage)
        imgtop = NSLayoutConstraint(item: startImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: frame.minY)
        imgleft = NSLayoutConstraint(item: startImage, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: frame.minX)
        imgright = NSLayoutConstraint(item: startImage, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -frame.minX)
        view.addConstraints([imgtop, imgleft, imgright,
                             NSLayoutConstraint(item: startImage, attribute: .height, relatedBy: .equal, toItem: startImage, attribute: .width, multiplier: 1, constant: 80)
            ])
        modalPresentationStyle = .overCurrentContext
        
        spotlightView = getSpotlightView()
        spotlightViewTwo = getSpotlightView()
        spotlightView.0?.alpha = 0
        spotlightViewTwo.0?.alpha = 0
        
        setUpStageAndCurtains()
    }
    
    func setUpStageAndCurtains(){
        stage = UIImageView(image: UIImage(named: "stage.jpg"))
        stage.contentMode = .scaleAspectFill
        stage.translatesAutoresizingMaskIntoConstraints = false
        stage.backgroundColor = UIColor.black
        stage.alpha = 0
        view.addSubview(stage)
        stageTop = NSLayoutConstraint(item: stage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 50)
        view.addConstraints([
            NSLayoutConstraint(item: stage, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: stage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 550),
            stageTop
        ])
        
        curtainOne = UIView()
        curtainOne.alpha = 0
        curtainOne.translatesAutoresizingMaskIntoConstraints = false
        curtainOne.backgroundColor = UIColor(colorLiteralRed: 125/256, green: 0, blue: 0, alpha: 1)
        view.addSubview(curtainOne)
        curtainOneRight = NSLayoutConstraint(item: curtainOne, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: -10)
        view.addConstraints([
            NSLayoutConstraint(item: curtainOne, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: curtainOne, attribute: .height, relatedBy: .equal, toItem: startImage, attribute: .height, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: curtainOne, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100),
            curtainOneRight
            ])
        
        curtainTwo = UIView()
        curtainTwo.alpha = 0
        curtainTwo.translatesAutoresizingMaskIntoConstraints = false
        curtainTwo.backgroundColor = UIColor(colorLiteralRed: 125/256, green: 0, blue: 0, alpha: 1)
        view.addSubview(curtainTwo)
        curtainTwoLeft = NSLayoutConstraint(item: curtainTwo, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 10)
        view.addConstraints([
            NSLayoutConstraint(item: curtainTwo, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: curtainTwo, attribute: .height, relatedBy: .equal, toItem: startImage, attribute: .height, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: curtainTwo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100),
            curtainTwoLeft
            ])
        
    }
    
    func getSpotlightView() -> (UIView?, CAShapeLayer?) {
        let maskLayer: CAShapeLayer = {
            let layer = CAShapeLayer()
            layer.fillRule = kCAFillRuleEvenOdd
            layer.fillColor = UIColor.black.cgColor
            return layer
        }()
        
        let mySpotlight = UIView()
        mySpotlight.frame = view.bounds
        mySpotlight.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        mySpotlight.isUserInteractionEnabled = false
        view.addSubview(mySpotlight)
        view.addConstraints([NSLayoutAttribute.top, .bottom, .left, .right].map {
            NSLayoutConstraint(item: view, attribute: $0, relatedBy: .equal, toItem: mySpotlight, attribute: $0, multiplier: 1, constant: 0)
        })
        
        mySpotlight.layer.mask = maskLayer
        let spotlight = Spotlight(center: CGPoint(x: 100, y: 100), diameter: 200)
        let beginPath = maskPath((spotlight.infinitesmalPath))
        let endPath = maskPath((spotlight.path))
        let an = pathAnimation(4, beginPath:beginPath, endPath: endPath)
        maskLayer.add(an, forKey: nil)
        return (mySpotlight, maskLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //items animate upon entering the view
        
        imgtop.constant = 0
        imgleft.constant = 0
        imgright.constant = 0
        stageTop.constant = -250
        curtainOneRight.constant = 50
        curtainTwoLeft.constant = -50
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .allowUserInteraction, animations: {
            self.spotlightView.0?.alpha = 1
            self.spotlightViewTwo.0?.alpha = 1
            self.stage.alpha = 0.6
            self.curtainOne.alpha = 1
            self.curtainTwo.alpha = 1
            self.animateSpotlight(start: CGPoint(x: 100, y: 100), end: CGPoint(x: 200, y: 400), maskLayer: self.spotlightView.1!)
            self.animateSpotlight(start: CGPoint(x: 400, y: 400), end: CGPoint(x: 100, y: 100), maskLayer: self.spotlightViewTwo.1!)
            self.view.layoutIfNeeded()
        }, completion: {
            complete in
            let when = DispatchTime.now() + 3.5
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.createView()
                self.doAnimate()
            }
        })
    }
    
    func animateSpotlight(start: CGPoint, end: CGPoint, maskLayer: CAShapeLayer) {
        let spotlight = Spotlight(center: start, diameter: 200)
        let beginPath = maskPath((spotlight.infinitesmalPath))
        let endPath = maskPath((spotlight.path))
        let an = pathAnimation(1.5, beginPath:beginPath, endPath: endPath)
        maskLayer.add(an, forKey: nil)
        
        let endPath2 = maskPath(Spotlight(center: end, diameter: 200).path)
        let an2 = pathAnimation(2.5, beginPath:nil, endPath: endPath2)
        maskLayer.add(an2, forKey: nil)
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            let endPath3 = self.maskPath(Spotlight(center: start, diameter: 200).path)
            let an3 = self.pathAnimation(1.5, beginPath:nil, endPath: endPath3)
            maskLayer.add(an3, forKey: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: when + 1.5) {
            let endPath3 = self.maskPath(Spotlight(center: self.startImage.center, diameter: 300).path)
            let an3 = self.pathAnimation(1.0, beginPath:nil, endPath: endPath3)
            maskLayer.add(an3, forKey: nil)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func doAnimate() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            //items fade in
            self.spotlightView.0?.alpha = 0
            self.spotlightViewTwo.0?.alpha = 0
            self.stage.alpha = 0
            self.curtainOne.alpha = 0
            self.curtainTwo.alpha = 0
            self.view.layoutIfNeeded()
        }, completion: {
            complete in
            self.spotlightView.0?.removeFromSuperview()
            self.spotlightViewTwo.0?.removeFromSuperview()
            self.stage.removeFromSuperview()
            self.curtainOne.removeFromSuperview()
            self.curtainTwo.removeFromSuperview()
            self.view.layoutIfNeeded()
        })
    }
    
    func maskPath(_ path: UIBezierPath) -> UIBezierPath {
        return [path].reduce(UIBezierPath(rect: view.frame)) {
            $0.append($1)
            return $0
        }
    }
    
    func pathAnimation(_ duration: TimeInterval, beginPath: UIBezierPath?, endPath: UIBezierPath) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.66, 0, 0.33, 1)
        if let path = beginPath {
            animation.fromValue = path.cgPath
        }
        animation.toValue = endPath.cgPath
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        return animation
    }
    
    //closes view
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setBackgroundImage() {
        guard let image = self.backgroundImage else { return }
        let img = UIImageView(getBlurImage: true, image: image)
        view.insertSubview(img, at: 0)
        view.addGenericConstraints(item: img, top: 0, left: 0, right: 0, bottom: 0)
    }
    
    
    func setUpCloseButton() {
        let close = UIButton()
        close.setImage(UIImage(named: "close-button"), for: .normal)
        close.addTarget(self, action: #selector(DetailVC.close), for: .touchUpInside)
        close.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(close)
        view.addConstraints([
            NSLayoutConstraint(item: close, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 15),
            NSLayoutConstraint(item: close, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25),
            NSLayoutConstraint(item: close, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25),
            NSLayoutConstraint(item: close, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -30)
            ])
    }
    
}

