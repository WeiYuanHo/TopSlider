//
//  TopSlider.swift
//  TopSlider
//
//  Created by Hou's Mac on 16/2/2.
//  Copyright © 2016年 霍伟元. All rights reserved.
//

import UIKit

class TopSlider: UIControl {
    
    //    var lineWidth: CGFloat! {
    //        set{
    //
    //        }
    //    }
    
    var backColor: UIColor! {
        set{
            self.sliderRenderer.backColor = newValue
        }
        get{
            return  self.sliderRenderer.backColor
        }
    }
    
    var lineColor: UIColor! {
        set{
            self.sliderRenderer.lineColor = newValue
        }
        get{
            return self.sliderRenderer.lineColor
        }
    }
    //
    var tipImage: UIImage! {
        set{
            self.sliderRenderer.tipImage = newValue
        }
        get{
            return self.sliderRenderer.tipImage
        }
    }
    
    var tipColor: UIColor! {
        set{
            self.sliderRenderer.tipColor = newValue
        }
        get{
            return self.sliderRenderer.tipColor
        }
    }
    
    
    var value: CGFloat! {
        set{
            self.sliderRenderer.value = newValue
        }
        get {
            return self.sliderRenderer.value
        }
    }
    
    var lineWidth: CGFloat! {
        set{
            self.sliderRenderer.lineWidtht = newValue
        }
        get{
            return self.sliderRenderer.lineWidtht
        }
    }
    
    var radius: CGFloat! {
        set{
            self.sliderRenderer.radius = newValue
        }
        get{
            return self.sliderRenderer.radius
        }
    }
    
    private var sliderRenderer: SliderRenderer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadLayer() {
        self.sliderRenderer = SliderRenderer()
        self.sliderRenderer.bounds = self.bounds
        self.layer.addSublayer(self.sliderRenderer.backLayer)
        self.layer.addSublayer(self.sliderRenderer.circleLayer)
        self.layer.addSublayer(self.sliderRenderer.lineLayer)
    }
}
