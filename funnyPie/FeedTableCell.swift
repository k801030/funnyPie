//
//  feedTableCell.swift
//  funnyPie
//
//  Created by 李哲維 on 2015/4/25.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

import UIKit

class FeedTableCell: UITableViewCell {
    
    /*
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    */
    
    let layoutMargin: CGFloat = 15.0
    
    var porfileImage = UIImageView()
    var usernameLabel = UILabel()
    var contentTextField = UITextView()
    var photoImage = UIImageView()
    var likeButton = UIButton()
    var shareButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.usernameLabel.font = UIFont(name: "System", size: 24)
        self.usernameLabel.textColor = UIColor.blackColor()
        self.usernameLabel.backgroundColor = colorWithHexString("#bee3ff")
        
        //NSLog("self size: %f", self.bounds.size.width)
        //NSLog("screen size: %f", screenRect.width)
        
        let ver = VerticalLayout(width: 50)
        let view1 = UIView(frame: CGRectMake(
            layoutMargin,
            layoutMargin,
            self.bounds.size.width-2*layoutMargin,
            40))
        view1.backgroundColor = colorWithHexString("#bee3ff")
        let view2 = UIView(frame: CGRectMake(
            layoutMargin,
            layoutMargin,
            self.bounds.size.width-2*layoutMargin,
            40))
        view2.backgroundColor = UIColor.blackColor()
        ver.addSubview(view1)
        ver.addSubview(view2)
        
        self.addSubview(ver)
        //setLayout()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    func setLayout() {
        
        //let cellContentView = UIView(frame: CGRectMake(5, 10, 300, 440)) as UIView
        //let usernameLabel = UILabel(frame: CGRectMake(5, 10, 222, 18))
        self.usernameLabel.textColor = UIColor.blackColor()
        self.usernameLabel.font = UIFont(name: "System", size: 14.0)
        self.usernameLabel.text = "User Name" //storys[row]["title"] as String
        
        
        //self.addSubview(cellContentView)
        //cellContentView.addSubview(usernameLabel)
    }
    
    // MARK: Hex Color Method
    
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (count(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
