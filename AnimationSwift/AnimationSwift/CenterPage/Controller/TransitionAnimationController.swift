//
//  TransitionAnimationController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/3.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

class TransitionAnimationController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var demoView: UIView? = nil
    var demoLabel: UILabel? = nil
    var index: NSInteger = 0

    override func initView() {
        super.initView()
        demoView = UIView.init(frame: CGRectMake(SCREEN_WIDTH / 2 - 90, SCREEN_HEIGHT / 2 - 200, 180, 260))
        self.view.addSubview(demoView!)
        demoLabel = UILabel.init(frame: CGRectMake(CGRectGetWidth((demoView?.frame)!) / 2 - 10, CGRectGetHeight((demoView?.frame)!)/2 - 10, 20, 40))
        demoLabel?.textAlignment = NSTextAlignment.Center
        demoView?.addSubview(demoLabel!)
        self.changeView(true)
    }

    override var operateTitleArray: NSArray{
        get{
            return ["fade", "moveIn", "push", "reveal", "cube", "suck", "oglFlip", "ripple", "Curl", "UnCurl", "caOpen", "caClose"]
        }
    }

    override var controllerTitle: String{
        get{
            return "过渡动画"
        }
    }

    override func clickBtn(btn: UIButton) {
        switch btn.tag {
        case 0:
            self.fadeAnimation()
        case 1:
            self.moveInAnimation()
        case 2:
            self.pushAnimation()
        case 3:
            self.revealAnimation()
        case 4:
            self.cubeAnimation()
        case 5:
            self.suckEffectAnimation()
        case 6:
            self.oglFlipAnimation()
        case 7:
            self.rippleEffectAnimation()
        case 8:
            self.pageCurlAnimation()
        case 9:
            self.pageUnCurlAnimation()
        case 10:
            self.cameraIrisHollowOpenAnimation()
        case 11:
            self.cameraIrisHollowCloseAnimation()
        default:
            break
        }
    }

    func fadeAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = kCATransitionFade
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "fadeAnimation")
    }

    func moveInAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = kCATransitionMoveIn
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "moveInAnimation")
    }

    func pushAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "pushAnimation")
    }

    func revealAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = kCATransitionReveal
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "revealAnimation")
    }

    func cubeAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "cube"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "revealAnimation")
    }

    func suckEffectAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "suckEffect"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "suckEffectAnimation")
    }

    func oglFlipAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "oglFlip"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "oglFlipAnimation")
    }

    func rippleEffectAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "rippleEffect"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "rippleEffectAnimation")
    }

    func pageCurlAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "pageCurl"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "pageCurlAnimation")
    }

    func pageUnCurlAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "pageUnCurl"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "pageUnCurlAnimation")
    }

    func cameraIrisHollowOpenAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "cameraIrisHollowOpen"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "cameraIrisHollowOpenAnimation")
    }

    func cameraIrisHollowCloseAnimation () {
        self.changeView(true)
        let animation: CATransition = CATransition.init()
        animation.type = "cameraIrisHollowClose"
        animation.subtype = kCATransitionFromRight
        animation.duration = 1.0
        demoView?.layer.addAnimation(animation, forKey: "cameraIrisHollowCloseAnimation")
    }

    func changeView (isUp: Bool) {
        if index > 3 {
            index = 0
        }

        if index < 0 {
            index = 3
        }

        let colors: NSArray = [UIColor.cyanColor(), UIColor.magentaColor(), UIColor.orangeColor(), UIColor.purpleColor()]
        let titles: NSArray = ["1", "2", "3", "4"]
        demoView?.backgroundColor = colors[index] as? UIColor
        demoLabel?.text = titles[index] as? String

        if isUp {
            index += 1
        }else{
            index -= 1
        }

    }
}
