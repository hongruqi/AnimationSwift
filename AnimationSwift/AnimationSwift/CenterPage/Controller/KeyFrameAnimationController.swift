//
//  KeyFrameAnimationController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/3.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

class KeyFrameAnimationController: BaseViewController {

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
        demoView = UIView.init(frame: CGRectMake(SCREEN_WIDTH / 2 - 25, SCREEN_HEIGHT / 2 - 50, 50, 50))
        demoView?.backgroundColor = UIColor.redColor()
        self.view.addSubview(demoView!)
    }

    override var operateTitleArray: NSArray{
        get{
            return ["关键帧", "路径", "抖动"]
        }
    }

    override var controllerTitle: String{
        get{
            return "关键帧动画"
        }
    }

    override func clickBtn(btn: UIButton) {
        switch btn.tag {
            case 0:
                self.keyFrameAnimation()
            case 1:
                self.pathAnimation()
            case 2:
                self.shakeAnimation()
            default:
                break
        }
    }

    override func animationDidStart(anim: CAAnimation) {
        print("开始动画")
    }

    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("结束动画")
    }

    func keyFrameAnimation() {
        let animation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        let value0: NSValue = NSValue.init(CGPoint: CGPointMake(0, SCREEN_HEIGHT / 2 - 50))
        let value1: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH / 3, SCREEN_HEIGHT / 2 - 50))
        let value2: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH / 3, SCREEN_HEIGHT / 2 + 50))
        let value3: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH * 2 / 3, SCREEN_HEIGHT / 2 + 50))
        let value4: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH * 2 / 3, SCREEN_HEIGHT / 2 - 50))
        let value5: NSValue = NSValue.init(CGPoint: CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT / 2 - 50))

        animation.values = [value0, value1, value2, value3, value4, value5]
        animation.duration = 2.0
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        demoView?.layer.addAnimation(animation, forKey: "keyFrameAnimation")
    }
    /**
     *  path动画
     */
    func pathAnimation() {
        let animation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        let path: UIBezierPath = UIBezierPath.init(ovalInRect: CGRectMake(SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2 - 100 , 200, 200))
        animation.path = path.CGPath
        animation.duration = 2.0
        demoView?.layer.addAnimation(animation, forKey: "pathAnimation")
    }
    /**
     *  抖动效果
     */
    func shakeAnimation() {
        let animation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "transform.rotation")
        let value1: NSValue = NSNumber.init(double: -M_PI / 180 * 4)
        let value2: NSValue = NSNumber.init(double: M_PI / 180 * 4)
        let value3: NSValue = NSNumber.init(double: -M_PI / 180 * 4)
        animation.values = [value1, value2, value3]
        animation.repeatCount = MAXFLOAT
        demoView?.layer.addAnimation(animation, forKey: "shakeAnimation")
    }
}
