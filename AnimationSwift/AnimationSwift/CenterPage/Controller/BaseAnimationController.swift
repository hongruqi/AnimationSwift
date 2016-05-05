//
//  BaseAnimationController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/4/27.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit


class BaseAnimationController: BaseViewController {

    var demoView: UIView? = nil


    override func initView() {
        super.initView()

        self.demoView = UIView.init(frame: CGRectMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT / 2 - 100, 100, 100))

        self.demoView?.backgroundColor = UIColor.redColor()

        self.view.addSubview(self.demoView!)

    }

    override var operateTitleArray: NSArray  {
        get{
           return ["位移", "透明度", "缩放", "旋转", "背景色"]
        }

    }
    override var controllerTitle: String{
        get{
            return "基础动画"
        }
    }
    override func clickBtn(btn: UIButton) {
        switch btn.tag {
        case 0:
            self.positionAnimation()
        case 1:
            self.opacityAnimation()
        case 2:
            self.scaleAnimation()
        case 3:
            self.rotateAnimation()
        case 4:
            self.backgroundAnimation()
        default:
            break
        }
    }

    /**
     *  位移动画演示
     */
    func positionAnimation() {
        let animation: CABasicAnimation = CABasicAnimation.init(keyPath: "position")
        animation.fromValue = NSValue.init(CGPoint: CGPointMake(0, SCREEN_HEIGHT/2 - 75))
        animation.toValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2 - 75))
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        self.demoView?.layer .addAnimation(animation, forKey: "positionAnimation")
    }

    /**
     *  透明度动画
     */
    func opacityAnimation() {
        let animation: CABasicAnimation = CABasicAnimation.init(keyPath: "opacity")
        animation.fromValue = NSNumber.init(float: 1.0)
        animation.toValue = NSNumber.init(float: 0.2)
        animation.duration = 1.0
        self.demoView?.layer.addAnimation(animation, forKey: "opacityAnimation")
    }

    /**
     *  缩放动画
     */
    func scaleAnimation() {
        let animation: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.toValue = NSNumber.init(float: 2.0)
        animation.duration = 1.0
        self.demoView?.layer.addAnimation(animation, forKey: "scaleAnimation")
    }

    /**
     *  旋转动画
     */
    func rotateAnimation() {
        let animation: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        animation.toValue = NSNumber.init(double: M_PI)
        animation.duration = 1.0
        self.demoView?.layer.addAnimation(animation, forKey: "rotateAnimation")
    }

    /**
     *  背景色变化动画
     */
    func backgroundAnimation() {
        let animation: CABasicAnimation = CABasicAnimation.init(keyPath: "backgroundColor")
        animation.toValue = UIColor.greenColor().CGColor
        animation.duration = 1.0
        self.demoView?.layer.addAnimation(animation, forKey: "backgroundAnimation")
    }

}
