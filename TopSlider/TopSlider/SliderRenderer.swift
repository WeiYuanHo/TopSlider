//
//  SliderRenderer.swift
//  TopSlider
//
//  Created by Hou's Mac on 16/2/2.
//  Copyright © 2016年 霍伟元. All rights reserved.
//

import UIKit

class SliderRenderer: NSObject {
    
    var lineWidtht: CGFloat! {
        didSet{
            self.lineLayer.lineWidth = self.lineWidtht
            self.backLayer.lineWidth = self.lineWidtht
            
            self.updateLineLayreShape()
            self.buildBackLayerShape()
        }
    }
    
    var radius: CGFloat! {
        didSet{
            self.updateCircleLayerShape()
        }
    }
    
    var backColor: UIColor! {
        didSet{
            if self.backColor != oldValue {
                self.backLayer.strokeColor = self.backColor.CGColor
            }
        }
    }
    
    var lineColor: UIColor! {
        didSet{
            if self.lineColor != oldValue {
                self.lineLayer.strokeColor = self.lineColor.CGColor
                self.updateLineLayreShape()
            }
        }
    }
    
    var tipImage: UIImage! {
        didSet{
            if self.tipImage != oldValue {
                self.circleLayer.fillColor = UIColor(patternImage: self.tipImage).CGColor
            }
        }
    }
    
    var tipColor: UIColor! {
        didSet{
            if self.tipColor != oldValue {
                self.circleLayer.fillColor = self.tipColor.CGColor
            }
        }
    }
    
    var value: CGFloat = 0 {
        didSet{
            let frame: CGRect = self.lineLayer.frame
            self.lineLayer.frame = CGRectMake(frame.origin.x, frame.origin.y, self.backLayer.frame.width*self.value, self.backLayer.frame.height)
            self.circleLayer.position = CGPointMake(self.backLayer.bounds.width*self.value, self.circleLayer.position.y)
            self.updateLineLayreShape()
        }
    }
    
    private func animate() -> CABasicAnimation {
        let rotationTransform: CATransform3D = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
        let animte: CABasicAnimation = CABasicAnimation(keyPath: "transform")
        animte.toValue = NSValue(CATransform3D: rotationTransform)
        animte.duration        = 0.5;
        animte.autoreverses    = false;
        animte.cumulative    = true;
        animte.repeatCount    = FLT_MAX;  //"forever"
        return animte
    }
    
    var lineLayer: CAShapeLayer! // 条状物前景
    var circleLayer: CAShapeLayer! // 圆状物
    var backLayer: CAShapeLayer! // 条状物背景
    
    override init() {
        super.init()
        self.lineLayer = CAShapeLayer()
        self.lineLayer.strokeColor = UIColor.blueColor().CGColor
        
        self.circleLayer = CAShapeLayer()
        self.circleLayer.fillColor = UIColor.redColor().CGColor
        
        self.backLayer = CAShapeLayer()
        self.backLayer.strokeColor = UIColor.orangeColor().CGColor
    }
    
    func updateLineLayreShape() {
        let bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0, CGRectGetHeight(self.lineLayer.bounds)*0.5))
        bezierPath.addLineToPoint(CGPointMake(CGRectGetWidth(self.lineLayer.bounds),CGRectGetHeight(self.lineLayer.bounds)*0.5))
        self.lineLayer.path = bezierPath.CGPath
    }
    
    func updateCircleLayerShape() {
    let center = CGPointMake(CGRectGetWidth(self.circleLayer.bounds)/2, CGRectGetHeight(self.circleLayer.bounds)/2)
        let radius = self.radius
        let bezierPath: UIBezierPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: false)
        self.circleLayer.path = bezierPath.CGPath
    }
    
    private func buildBackLayerShape() {
        let bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0, CGRectGetHeight(self.backLayer.bounds)*0.5))
        bezierPath.addLineToPoint(CGPointMake(CGRectGetWidth(self.backLayer.bounds),CGRectGetHeight(self.backLayer.bounds)*0.5))
        self.backLayer.path = bezierPath.CGPath
    }
    
    var bounds: CGRect! {
        didSet{
            self.lineLayer.frame = CGRectMake(self.bounds.origin.x, self.bounds.height/2, 0, self.bounds.height/2)
            self.circleLayer.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.height/2, self.bounds.size.height/2)
            self.circleLayer.position = CGPointMake(0, CGRectGetHeight(self.circleLayer.bounds)/2)
            self.backLayer.frame = CGRectMake(self.bounds.origin.x, self.bounds.height/2, self.bounds.width, self.bounds.height/2)
            
            self.circleLayer.addAnimation(self.animate(), forKey: "transform")
            
            
            self.backLayer.lineWidth = self.bounds.height/2
            self.lineLayer.lineWidth = self.bounds.height/2
            self.radius = self.bounds.height/4
            
            
            self.buildBackLayerShape()
            self.updateLineLayreShape()
        }
    }
    
}
