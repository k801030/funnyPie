//
//  feedTableCell.swift
//  funnyPie
//
//  Created by 李哲維 on 2015/4/25.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

import UIKit

class FeedTableCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    /*
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    */
    
    let layoutMargin: CGFloat = 15.0
    var layoutWidth: CGFloat = 0.0
    var layoutHeight: CGFloat = 0.0
    
    var cellHeight: CGFloat = 0.0;
    
    var porfileImage = UIImageView() // reqiured to set it
    var usernameLabel = UILabel() // reqiured to set it
    var contentTextView = UITextView() // reqiured to set it
    
    var optionList = [] // array of options; required to set it
    var optionTableView = UITableView()
    let optionCellIdentifier = "optionCell"
    var photoImage = UIImageView()
    var likeButton = UIButton()
    var shareButton = UIButton()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layoutWidth = self.bounds.size.width
        self.layoutHeight = self.bounds.size.height
        
        self.usernameLabel.font = UIFont(name: "System", size: 24)
        self.usernameLabel.textColor = UIColor.blackColor()
        self.usernameLabel.backgroundColor = colorWithHexString("#bee3ff")
        
        //NSLog("self size: %f", self.bounds.size.width)
        //NSLog("screen size: %f", screenRect.width)
        
        let vtLayout = VerticalLayout(width: self.bounds.size.width, margin: layoutMargin)
        vtLayout.setOffset(5.0)
        
        let topView = HorizontalLayout(height: 40)
        topView.setOffset(5.0)
        
        let profileView = topView.autoCreatedView(40)
        profileView.backgroundColor = colorWithHexString("#bee3ff")
        
        usernameLabel = UILabel(frame: CGRectMake(0, 0, 120, topView.fullHeight))

        contentTextView = UITextView(frame: CGRectMake(0, 0, vtLayout.fullWidth, 60))
        
        optionTableView = UITableView(frame: CGRectMake(0, 0, vtLayout.fullWidth, 160))
        
        let bottomView = HorizontalLayout(height: 40)
        
        likeButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        likeButton.frame = CGRectMake(0, 0, 60, bottomView.fullHeight)
        likeButton.setTitle("Like", forState: .Normal)
        likeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        shareButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        shareButton.frame = CGRectMake(0, 0, 60, bottomView.fullHeight)
        shareButton.setTitle("Share", forState: .Normal)
        shareButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
 
        vtLayout.addSubview(topView)
        vtLayout.addSubview(contentTextView)
        vtLayout.addSubview(optionTableView)
        vtLayout.addSubview(bottomView)
        
        topView.addSubview(profileView)
        topView.addSubview(usernameLabel)
        
        bottomView.addSubview(likeButton)
        bottomView.addSubview(shareButton)
        
        self.addSubview(vtLayout)
        cellHeight = vtLayout.bounds.height
        
        // register new class
        self.optionTableView.registerClass(UITableViewCell.self as AnyClass, forCellReuseIdentifier: optionCellIdentifier)
        self.optionTableView.dataSource = self;
        self.optionTableView.delegate = self;
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    // MARK: UITableView Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.optionList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(optionCellIdentifier, forIndexPath: indexPath) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: optionCellIdentifier)
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        
        
        let row = indexPath.row
        // change cell's size
        //cell.frame = CGRectMake(0.0, 0.0, screenRect.width, 72.0)
        
        cell?.textLabel?.text = optionList[indexPath.row] as? String
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

    
    // MARK: return cell's height
    func getHeight() -> CGFloat {
        return cellHeight
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
