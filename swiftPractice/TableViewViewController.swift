//
//  TableViewViewController.swift
//  swiftPractice
//
//  Created by huiren on 16/3/25.
//
//

import UIKit

class TableViewViewController: BackViewController ,UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate {
    @IBOutlet weak var tableView: UITableView!
    let photoImage : UIImageView = UIImageView.init()
    let value = Int(arc4random() % 9)
    
    let colorArray:[UIColor] = [UIColor .greenColor(), UIColor .blackColor(), UIColor.orangeColor(), UIColor.grayColor(), UIColor.yellowColor(), UIColor.blueColor(), UIColor.brownColor(), UIColor.blackColor(), UIColor.purpleColor(), UIColor.redColor()]
    let nameArray = ["adriano.jpg", "crespo.jpg", "henry.jpg", "inzaggi.jpg", "owen.jpg", "raul.jpg", "ronaldo.jpg", "shevchenko.jpg", "vannisterooy.jpg", "vieri.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView .registerNib(UINib(nibName: "XKLTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    /*
        tableView代理方法
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! XKLTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        if value == indexPath.row {
            cell.leftView.hidden = false
            cell.userInteractionEnabled = true
        } else {
            cell.leftView.hidden = true
            cell.userInteractionEnabled = false
        }
//        cell.theImageView?.backgroundColor = colorArray[indexPath.row]
        cell.theImageView.layer.borderWidth = 0.5
        cell.theImageView.layer.borderColor = colorArray[indexPath.row].CGColor
        cell.theImageView.image = UIImage(named: nameArray[indexPath.row])
        cell.theImageView.userInteractionEnabled = true
//        let row = 9 - indexPath.row
//        cell.lineImage.backgroundColor = colorArray[value]
//        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        photoImage.image = UIImage(named: nameArray[indexPath.row])
        let actionSheet = UIActionSheet.init()
        actionSheet.title = "这是谁"
        actionSheet.addButtonWithTitle("我知道他的名字")
        actionSheet.addButtonWithTitle("我知道他效力的球队")
        actionSheet.addButtonWithTitle("他的一切我都了解")
        actionSheet.addButtonWithTitle("图片太小看不清")
        actionSheet.addButtonWithTitle("取消")
        actionSheet.cancelButtonIndex = 5
        actionSheet.delegate = self
        actionSheet.showInView(view)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 3 {
            let avatarBrowser = XKLAvatarBrowser() 
            avatarBrowser.showImage(photoImage)
            
        }
    }

}
