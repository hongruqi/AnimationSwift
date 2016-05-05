//
//  AffineTransformController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/3.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

extension AffineTransformController {
//    var demoView: UIView {
//            self.demoView.backgroundColor = UIColor.redColor()
//            demoView = UIView.init(frame: CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2 - 100, 100, 100))
//        return demoView
//    }
}

class AffineTransformController: BaseViewController {

    var demoView: UIView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        demoView = UIView.init(frame: CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2 - 100, 100, 100))
        demoView!.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.demoView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func initView() {
        super.initView()
    }

    override var operateTitleArray: NSArray{

        get{
            return ["位移", "缩放", "旋转", "组合", "反转"]
        }
    }

    override var controllerTitle: String{
        get{
            return "放射变换"
        }
    }

    override func clickBtn(btn: UIButton) {
        switch btn.tag {
        case 0:
            self.positionAnimation()
        case 1:
            self.scaleAnimation()
        case 2:
            self.rotateAnimation()
        case 3:
            self.combinationAnimation()
        case 4:
            self.invertAnimation()
        default:
            break
        }
    }
    
    func positionAnimation () {
        demoView!.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(1.0) { 
            self.demoView!.transform = CGAffineTransformMakeTranslation(100, 100)
        }
    }

    func scaleAnimation () {
        demoView!.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(1.0) {
            self.demoView!.transform = CGAffineTransformMakeScale(2, 2)
        }
    }

    func rotateAnimation () {
        demoView!.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(1.0) {
            self.demoView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        }
    }

    func combinationAnimation() {
        //仿射变换的组合使用
        demoView!.transform = CGAffineTransformIdentity;
        UIView.animateWithDuration(1.0) {
            let transform1: CGAffineTransform  = CGAffineTransformMakeRotation(CGFloat(M_PI))
            let transform2: CGAffineTransform  = CGAffineTransformScale(transform1, 0.5, 0.5)
            self.demoView!.transform = CGAffineTransformTranslate(transform2, 100, 100)
        }
    }

    func invertAnimation(){
        demoView!.transform = CGAffineTransformIdentity;
        UIView.animateWithDuration(1.0) {
            //矩阵反转
            self.demoView!.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2));
        }
    }

}
