//
//  FirstViewController.swift
//  funnyPie
//
//  Created by 李哲維 on 2015/4/23.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let storys: NSMutableArray = []
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("%f", tableView.bounds.width)
        // load sample data
        let game = ["content": "I hates Games\nhaha", "name": "John"]
        let sport = ["content": "Sports", "name": "Helen"]
        let movie = ["content": "Good night, everyone!", "name": "Jessica"]
        self.storys.addObject(game)
        self.storys.addObject(sport)
        self.storys.addObject(movie)
        
        
        // register a custom cell
        var nib = UINib(nibName: "FeedTableCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        self.tableView.allowsSelection = false
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storys.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! FeedTableCell
        
        
        let row = indexPath.row
        // change cell's size
        //cell.frame = CGRectMake(0.0, 0.0, screenRect.width, 72.0)

        cell.usernameLabel.text = storys[row]["name"] as? String
        cell.contentTextView.text = storys[row]["content"] as? String
        cell.likeButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        cell.likeButton.tag = indexPath.row
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //let cell = tableView.cellForRowAtIndexPath(indexPath) as! FeedTableCell
        //return cell.getHeight()
        return 360;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func buttonAction(sender: UIButton) {
        NSLog("action of username: %d",sender.tag)
        let row = sender.tag
        var title: String = self.storys[row]["content"] as! String
        NSLog("output: %@", title)
    }
}

