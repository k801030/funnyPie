//
//  VerticalLayout.swift
//  funnyPie
//
//  Created by 李哲維 on 2015/4/25.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

import UIKit

class VerticalLayout: UIView {
    
    var yOffset: CGFloat = 0
    var fullWidth: CGFloat = 0
    
    init(width: CGFloat) {
        super.init(frame: CGRectMake(0, 0, width, 0))
        self.fullWidth = width;
    }
    
    init(width: CGFloat, margin: CGFloat) {
        super.init(frame: CGRectMake(margin, margin, width-2*margin, 0))
        self.fullWidth = width-2*margin;
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var height: CGFloat = 0
        
        for i in 0..<subviews.count {
            var view = subviews[i] as! UIView
            view.layoutSubviews()
            view.frame.origin.y = height
            height += yOffset
            height += view.frame.size.height
        }
        
        self.frame.size.height = height
    }
    override func addSubview(view: UIView) {
        super.addSubview(view)
    }
    
    // set it before adding viewers
    func setOffset(offset: CGFloat) {
        self.yOffset = offset;
    }
    
    // auto created full size layout
    func autoCreatedView(height: CGFloat) -> UIView {
        let view = UIView(frame: CGRectMake(0, 0, self.fullWidth, height))
        return view
    }


}
