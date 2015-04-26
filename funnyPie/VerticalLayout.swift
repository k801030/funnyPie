//
//  VerticalLayout.swift
//  funnyPie
//
//  Created by 李哲維 on 2015/4/25.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

import UIKit

class VerticalLayout: UIView {
    
    let yOffset: CGFloat = 0
    
    init(width: CGFloat) {
        super.init(frame: CGRectMake(0, 0, width, 0))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var height: CGFloat = 0
        
        for i in 0..<subviews.count {
            var view = subviews[i] as! UIView
            view.layoutSubviews()
            height += yOffset
            view.frame.origin.y = height
            height += view.frame.height
        }
        
        self.frame.size.height = height
    }
    override func addSubview(view: UIView) {
        super.addSubview(view)
    }

}
