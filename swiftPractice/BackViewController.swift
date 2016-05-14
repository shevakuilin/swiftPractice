//
//  BackViewController.swift
//  swiftPractice
//
//  Created by huiren on 16/5/9.
//
//

import UIKit

class BackViewController: UIViewController , UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = backButtonWithTarget(self, selector: "popBack")
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //返回按钮格式
    func backButtonWithTarget(target: AnyObject?, selector: Selector) -> UIBarButtonItem {
        let button : UIButton = UIButton(type: .Custom)
        button.frame = CGRectMake(-15, 0, 30, 30)
//        button.setTitle("返回", forState: UIControlState.Normal)
//        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
//        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        
//        let image = (UIImage(named: "backItem"))
//        let edge = UIEdgeInsetsMake(0, 0, 0, 8)
//        let resizeImage = image?.resizableImageWithCapInsets(edge)
        button.setImage(UIImage(named: "backItem"), forState: UIControlState.Normal)
        button.addTarget(target, action: selector, forControlEvents: UIControlEvents.TouchUpInside)
        
        let barButtonItem : UIBarButtonItem = UIBarButtonItem.init(customView: button)
        
        return barButtonItem
    }
    
    func popBack () {
        let bool : Bool = true
        self.navigationController?.popViewControllerAnimated(bool)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
