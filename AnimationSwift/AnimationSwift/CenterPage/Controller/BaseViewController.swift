//
//  BaseViewController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/4/27.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

let SCREEN_WIDTH: CGFloat = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.mainScreen().bounds.size.height

class BaseViewController: ViewController {

    var operateTitleArray : NSArray {
        get{
            return []
        }
    }

    var controllerTitle: String {
        get{
            return "默认"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    internal func initView() {
        let containerView: UIView = UIView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 60))
        containerView.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(containerView)

        let label: UILabel = UILabel.init(frame: CGRectMake(0, 20, SCREEN_WIDTH, 40))

        label.textAlignment = NSTextAlignment.Center
        label.text = self.controllerTitle
        containerView.addSubview(label)
        self.view.backgroundColor = UIColor.whiteColor()

        if self.operateTitleArray.count > 0 {
            let row: NSInteger = (self.operateTitleArray.count) % 4 == 0 ? (self.operateTitleArray.count) / 4 : (self.operateTitleArray.count) / 4 + 1
            let operateView: UIView = UIView.init(frame: CGRectMake(0, SCREEN_HEIGHT - (CGFloat)(row * 50 + 20), SCREEN_WIDTH, (CGFloat)(row * 50 + 20)))
            self.view.addSubview(operateView)

            for index in 0 ... self.operateTitleArray.count - 1 {
                let btn: TitleButton = TitleButton()

                btn.initWithFrame(self.rectForBtnAtIndex(index, totleNum: (self.operateTitleArray.count)), title: self.operateTitleArray[index] as! String)
                btn.tag = index
                btn.addTarget(self, action: #selector(BaseViewController.clickBtn(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                operateView.addSubview(btn)
            }
        }

        let revealController: SWRevealViewController = self.revealViewController()
        self.view.addGestureRecognizer(revealController.panGestureRecognizer())

    }

    func clickBtn(btn: UIButton) {

    }

    func rectForBtnAtIndex(index: NSInteger, totleNum totalNum: NSInteger) -> CGRect {
        //每一行最多显示4个
        let  maxColumnNum: NSInteger = 4
        //每个按钮的列间距
        let columnMargin: CGFloat  = 20;
        //每个按钮的行间距
        let rowMargin: CGFloat  = 20;
        //行数
        // NSUInteger row = totleNum/maxColumnNum;
        //每个按钮的宽度
        let width: CGFloat  = (SCREEN_WIDTH - columnMargin*5)/4;
        //每个按钮的高度
        let height: CGFloat  = 30;

        //每个按钮的偏移
        let offsetX: CGFloat  = columnMargin + (CGFloat)(index%maxColumnNum)*(width+columnMargin);
        let offsetY: CGFloat  = rowMargin + (CGFloat)(index/maxColumnNum)*(height+rowMargin);

        return CGRectMake(offsetX, offsetY, width, height);
    }
}
