//
//  ViewController.swift
//  swiftPractice
//
//  Created by huiren on 16/3/22.
//
//


import UIKit

class ViewController: UIViewController {
    let screen = UIScreen.mainScreen().bounds
    
    /*
        以上是object-c中使用的宏在swift中的代替方案
    */
    @IBOutlet weak var button: UIButton!
    let string = "啦啦啦啦啦"
    var array = ["罗纳尔多", "舍甫琴科", "亨利", "范尼斯特鲁伊", "劳尔", "因扎吉", "欧文", "维埃里", "阿德里亚诺", "克雷斯波"]
    var arryString:String = ""
    var colorArray:[UIColor] = [UIColor .greenColor(), UIColor .blackColor(), UIColor.orangeColor(), UIColor.grayColor(), UIColor.yellowColor(), UIColor.blueColor(), UIColor.brownColor(), UIColor.blackColor(), UIColor.purpleColor(), UIColor.redColor()]
    
    let label = UILabel.init(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2 - 50, UIScreen.mainScreen().bounds.height/4, 100, 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.titleLabel?.text = "前锋top10"
        button.setTitle("前锋top10", forState: UIControlState.Normal)
        label.textAlignment = NSTextAlignment.Center
        label.text = "看看有谁"
        label.textColor = UIColor.redColor()
        label.font = UIFont.boldSystemFontOfSize(14)

        view.addSubview(label)
        
        print("这里是string:", self.string)
        
        for var i:Int = 0; i < 5; i++ {
            print(self.array[i])

            arryString = array[i]
            print("这里是array: \(array[i])")
            print("这里也是array:", array[i])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    //button的点击响应
    @IBAction func touchButton(sender: UIButton) {
        let value = Int(arc4random() % 10)
        let color = colorArray[value]

        button.setTitle(array[value], forState: UIControlState.Normal)
        button.setTitleColor(color, forState: UIControlState.Normal)
        label.text = button.titleLabel?.text
        label.textColor = color
        
    }
    
    @IBAction func goListButton(sender: UIButton) {
        let myStroyBoard = storyboard
        let listView:UIViewController = (myStroyBoard?.instantiateViewControllerWithIdentifier("list"))!
//        self.presentViewController(listView, animated: true, completion: nil)
        self.navigationController?.pushViewController(listView, animated: true)
    }
    
    

}

