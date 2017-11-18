
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

class DetailVC: SpotlightDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
    }
    
    //closes view
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func animationComplete() {
        setUpCloseButton()
        view.layoutIfNeeded()
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

