//
//  RightViewController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/3.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        let label:UILabel = UILabel.init(frame: CGRectMake(SCREEN_WIDTH/2 - 100 , 100, 200, 100))
        label.text = "右边侧滑栏"
        label.font = UIFont.systemFontOfSize(22)
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
