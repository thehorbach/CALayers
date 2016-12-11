//
//  RoundedView.swift
//  RWBooks
//
//  Created by Vyacheslav Horbach on 11/12/16.
//  Copyright © 2016 Ray Wenderlich. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30.0, height: 30.0)).cgPath
        layer.mask = shapeLayer
    }
}
    
