//
//  SpotlightViewController.swift
//  Gecco
//
//  Created by yukiasai on 2016/01/15.
//  Copyright (c) 2016 yukiasai. All rights reserved.
//

import UIKit

extension DetailVC {
    
    func setupContentView() {
        contentView.frame = view.bounds
        contentView.backgroundColor = UIColor.clear
        view.addSubview(contentView)
        view.addConstraints([NSLayoutAttribute.top, .bottom, .left, .right].map {
            NSLayoutConstraint(item: view, attribute: $0, relatedBy: .equal, toItem: contentView, attribute: $0, multiplier: 1, constant: 0)
        })
    }
}
