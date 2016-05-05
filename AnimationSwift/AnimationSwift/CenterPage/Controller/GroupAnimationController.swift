//
//  GroupAnimationController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/3.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

class GroupAnimationController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var demoView: UIView? = nil

    override func initView() {
        super.initView()
        demoView = UIView.init(frame: CGRectMake(SCREEN_WIDTH / 2 - 25 , SCREEN_HEIGHT / 2 - 50, 50, 50))
        demoView?.backgroundColor = UIColor.redColor()
        self.view.addSubview(demoView!)
    }

    override var operateTitleArray: NSArray{
        get{
            return ["同时", "连续"]
        }
    }

    override func clickBtn(btn: UIButton) {
        switch btn.tag {
            case 0:
                self.groupAnimation1()
            case 1:
                self.groupAnimation2()
            default:
                break
        }
    }

    override var controllerTitle: String{
        get{
            return "组动画"
        }
    }

    func groupAnimation1() {
        let animation1: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        let value0: NSValue = NSValue.init(CGPoint: CGPointMake(0, SCREEN_HEIGHT / 2 - 50))
        let value1: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH / 3, SCREEN_HEIGHT / 2 - 50))
        let value2: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH / 3, SCREEN_HEIGHT / 2 + 50))
        let value3: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH*2 / 3, SCREEN_HEIGHT / 2 + 50))
        let value4: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH*2 / 3, SCREEN_HEIGHT / 2 - 50))
        let value5: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT / 2 - 50))
        animation1.values = [value0, value1, value2, value3, value4, value5]

        let animation2: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        animation2.fromValue = NSNumber.init(float: 0.8)
        animation2.toValue = NSNumber.init(float: 2.0)

        let animation3: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        animation3.toValue = NSNumber.init(double: M_PI * 4)

        let groupAnimation: CAAnimationGroup = CAAnimationGroup.init()
        groupAnimation.animations = [animation1, animation2, animation3]
        groupAnimation.duration = 4.0
        demoView?.layer.addAnimation(groupAnimation, forKey: "groupAnimation")
    }

    func groupAnimation2() {
        let currentTime: CFTimeInterval = CACurrentMediaTime()

        let animation1: CABasicAnimation = CABasicAnimation.init(keyPath: "position")
        animation1.fromValue = NSValue.init(CGPoint: CGPointMake(0, SCREEN_HEIGHT / 2 - 75))
        animation1.toValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 - 75))
        animation1.beginTime = currentTime
        animation1.duration = 1.0
        animation1.fillMode = kCAFillModeForwards
        animation1.removedOnCompletion = false
        demoView?.layer.addAnimation(animation1, forKey: "aa")

        let animation2: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        animation2.fromValue = NSNumber.init(float: 0.8)
        animation2.toValue = NSNumber.init(float: 2.0)
        animation2.beginTime = currentTime + 1.0
        animation2.duration = 1.0
        animation2.fillMode = kCAFillModeForwards
        animation2.removedOnCompletion = false
        demoView?.layer.addAnimation(animation2, forKey: "bb")

        let animation3: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        animation3.toValue = NSNumber.init(double: M_PI * 4)
        animation3.beginTime = currentTime + 2.0
        animation3.duration = 1.0
        animation3.fillMode = kCAFillModeForwards
        animation3.removedOnCompletion = false
        demoView?.layer.addAnimation(animation3, forKey: "cc")
    }
}

