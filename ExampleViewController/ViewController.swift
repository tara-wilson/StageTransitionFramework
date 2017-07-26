//
//  ViewController.swift
//  ExampleViewController
//
//  Created by Tara Wilson on 7/10/17.
//  Copyright © 2017 twil. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var startImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        startImageView = UIImageView(frame: CGRect(x: 100, y: 90, width: view.frame.width - 200, height: view.frame.width - 120))
        startImageView.contentMode = .scaleAspectFill
        startImageView.clipsToBounds = true
        startImageView.image = UIImage(named: "band7.jpeg")
        view.addSubview(startImageView)
        
        let goButton = UIButton(frame: CGRect(x: 50, y: view.frame.width + 20, width: view.frame.width - 100, height: 100))
        goButton.setTitleColor(.black, for: .normal)
        goButton.setTitle("GO", for: .normal)
        goButton.addTarget(self, action: #selector(ViewController.openView), for: .touchUpInside)
        view.addSubview(goButton)
        
    }
    
    func openView() {        
        let imageone = UIImage(named: "interface-screenshot0-1.png")
        let imagetwo = UIImage(named: "shareimage.png")
        
        let vc = DetailVC(image: startImageView.image!, frame: startImageView.frame)
        vc.backgroundImage = imageone
        vc.shareImage = imagetwo
        present(vc, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

