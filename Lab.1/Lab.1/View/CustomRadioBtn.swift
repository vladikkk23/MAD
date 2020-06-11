//
//  CustomRadioBtn.swift
//  Lab.1
//
//  Created by vladikkk on 18/09/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import UIKit

class CustomRadioBtn : UIButton {
    
    // MARK : Properties
    
    /*
     These will set the gap size.
     */
    var gapSize: CGFloat = 17 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    /*
     Setting button's color.
     */
    var color: UIColor = .blue {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    /*
     Status indicator.
     */
    var isOn: Bool = true {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    // MARK : Methods
    
    /*
     Draw's button's inner and outer circles.
     */
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.lineWidth = 2
        circleLayer.strokeColor = self.color.cgColor
        circleLayer.fillColor = UIColor.lightText.cgColor
        layer.addSublayer(circleLayer)
        
        if (isOn) {
            let innerCircleLayer = CAShapeLayer()
            let rectForInnerCircle = CGRect(x: self.gapSize,
                                            y: self.gapSize,
                                            width: rect.width - 2 * self.gapSize,
                                            height: rect.height - 2 * self.gapSize)
            
            innerCircleLayer.path = UIBezierPath(ovalIn: rectForInnerCircle).cgPath
            innerCircleLayer.fillColor = self.color.cgColor
            layer.addSublayer(innerCircleLayer)
            
            self.isSelected = true
        }
        
        self.isSelected = false
        self.layer.shouldRasterize =  true
        self.layer.rasterizationScale = UIScreen.main.nativeScale
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        isOn = false
    }
    
    /*
     Changes button's status indicator when it has been pressed.
     */
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isOn = !isOn
            self.setNeedsDisplay()
        }
    }
}
