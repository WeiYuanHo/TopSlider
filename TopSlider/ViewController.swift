//
//  ViewController.swift
//  TopSlider
//
//  Created by Hou's Mac on 16/2/2.
//  Copyright © 2016年 霍伟元. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var topSlider: TopSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topSlider = TopSlider(frame: CGRectMake(0, 0, 300, 30))
        self.topSlider.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2, CGRectGetHeight(self.view.bounds)/2)
        
        self.topSlider.lineColor = UIColor.blackColor()
        self.topSlider.backColor = UIColor.redColor()
        self.topSlider.tipImage = UIImage(named: "tipImage")
        self.topSlider.lineWidth = 8
        self.topSlider.radius = 10
        
        self.view.addSubview(self.topSlider)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func test2(sender: UISlider) {
        self.topSlider.value = CGFloat(sender.value)
    }
}

