# TopSlider
![](https://github.com/WeiYuanHo/TopSlider/blob/master/TopView.gif)
### 方法
	self.topSlider = TopSlider(frame: CGRectMake(0, 0, 300, 30))
        self.topSlider.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2, CGRectGetHeight(self.view.bounds)/2)
        
        self.topSlider.lineColor = UIColor.blackColor()
        self.topSlider.backColor = UIColor.redColor()
        self.topSlider.tipImage = UIImage(named: "tipImage")
        self.topSlider.lineWidth = 8
        self.topSlider.radius = 10
        
        self.view.addSubview(self.topSlider)
