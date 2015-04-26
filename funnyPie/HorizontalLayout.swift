//
//  HorizontalLayout.swift
//  funnyPie
//
//  Created by 李哲維 on 2015/4/26.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

import UIKit

class HorizontalLayout: UIView {
    
    var xOffset: CGFloat = 0
    var fullHeight: CGFloat = 0
    
    init(height: CGFloat) {
        super.init(frame: CGRectMake(0, 0, 0, height))
        fullHeight = self.bounds.height
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var width: CGFloat = 0

        for i in 0..<subviews.count {
            var view = subviews[i] as! UIView
            view.layoutSubviews()
            view.frame.origin.x = width
            width += xOffset
            width += view.frame.size.width
        }
        
        self.frame.size.width = width
    }
    
    // set it before adding viewers
    func setOffset(offset: CGFloat) {
        xOffset = offset;
    }
    
    override func addSubview(view: UIView) {
        super.addSubview(view)
    }
    
    // auto created full size layout
    func autoCreatedView(width: CGFloat) -> UIView {
        let view = UIView(frame: CGRectMake(0, 0, width, self.bounds.height))
        return view
    }

    
}
