//
//  XKLAvatarBrowser.swift
//  swiftPractice
//
//  Created by huiren on 16/5/12.
//
//

import UIKit

class XKLAvatarBrowser: UIView {

    var oldframe : CGRect!
    
    func showImage (avatarImageView : UIImageView) {
        let image : UIImage = avatarImageView.image!
        let window : UIWindow = UIApplication.sharedApplication().keyWindow!
        let backgroundView : UIView = UIView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        oldframe = avatarImageView.convertRect(avatarImageView.bounds, toView: window)
        
        backgroundView.backgroundColor = UIColor.blackColor()
        backgroundView.alpha = 0
        let imageView : UIImageView = UIImageView.init(frame: oldframe)
        imageView.image = image
        imageView.tag = 1
        backgroundView.addSubview(imageView)
        
        window.addSubview(backgroundView)
        
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: "hideImage")
        backgroundView.addGestureRecognizer(tap)
        
        UIView.animateWithDuration(0.3, animations: { ()
            imageView.frame = CGRectMake(0, (UIScreen.mainScreen().bounds.size.height - image.size.height * UIScreen.mainScreen().bounds.size.width / image.size.width) / 2, UIScreen.mainScreen().bounds.size.width, image.size.height * UIScreen.mainScreen().bounds.size.width / image.size.width)
            
            backgroundView.alpha = 1
            
            }) { (Bool) -> Void in
                
        }
        
        
        
    } 
    
    
    func hideImage (tap : UITapGestureRecognizer) {
        let backgroundView : UIView = tap.view!
        let imageView : UIImageView = tap.view?.viewWithTag(1) as! UIImageView
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            imageView.frame = self.oldframe
            backgroundView.alpha = 0
        
            }) { (Bool) -> Void in
                backgroundView.removeFromSuperview()
        }
    }

}
