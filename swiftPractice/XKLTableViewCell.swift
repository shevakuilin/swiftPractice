//
//  XKLTableViewCell.swift
//  swiftPractice
//
//  Created by huiren on 16/3/25.
//
//

import UIKit

class XKLTableViewCell: UITableViewCell {

    
    @IBOutlet weak var theImageView: UIImageView!//
    @IBOutlet weak var lineImage: UIImageView!//线
    @IBOutlet weak var leftView: UIView!//左侧显示view
    
    override func awakeFromNib() {
        super.awakeFromNib()
        theImageView.layer.masksToBounds = true;
        theImageView.layer.cornerRadius = theImageView.frame.size.height/2
        lineImage.backgroundColor = UIColor.blackColor()
        

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
