//
//  DCPathButton.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/3.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

protocol DCPathButtonDelegate: NSObjectProtocol{

    func itemButtonTappedAtIndex(index: Int)

}

class DCPathButton: UIView, DCPathCenterButtonDelegate, DCPathItemButtonDelegate {

    weak var delgate: DCPathButtonDelegate?

    var centerImage: UIImage?
    var centerHighlightedImage: UIImage?

    var itemButtonImages: NSMutableArray?
    var itemButtonHighlightedImages: NSMutableArray?
    var itemButtons: NSMutableArray?

    init(centerImage: UIImage, hilightedImage centerHighlightedImage: UIImage){
        super.init(frame: CGRectZero)

        self.centerImage = centerImage
        self.centerHighlightedImage = centerHighlightedImage
        self.itemButtons = NSMutableArray()
        self.itemButtonImages = NSMutableArray()
        self.itemButtonHighlightedImages = NSMutableArray()
        self.configureViewsLayout()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addPathItems(pathItemButtons: NSArray) {
        self.itemButtons?.addObjectsFromArray(pathItemButtons as [AnyObject])
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.pathCenterButtonFold()
    }

    var foldedSize: CGSize = CGSizeZero
    var bloomSize: CGSize = CGSizeZero

    var foldcenter: CGPoint = CGPointZero
    var bloomCenter: CGPoint = CGPointZero
    var pathCenterButtonBloomCenter: CGPoint = CGPointZero
    var expandCenter: CGPoint = CGPointZero
    var bloom: Bool = false
    var bloomRadius: CGFloat = 0.0
    var pathCenterButton: DCPathCenterButton?{
         didSet {
            print("set center button \(pathCenterButton?.center)")
        }
    }
    var bottomView: UIView = UIView()

    func configureViewsLayout() {

        self.foldedSize = self.centerImage!.size
        self.bloomSize = UIScreen.mainScreen().bounds.size
        self.bloom = false
        self.bloomRadius = 105.0
        self.foldcenter = CGPointMake(self.bloomSize.width / 2, self.bloomSize.height - 225.5)
        self.bloomCenter = CGPointMake(self.bloomSize.width / 2, self.bloomSize.height / 2)
        self.frame = CGRectMake(0, 0, self.foldedSize.width, self.foldedSize.height)
        self.center = self.foldcenter

        self.pathCenterButton = DCPathCenterButton.init(image: self.centerImage, highlightedImage: self.centerHighlightedImage)
        self.pathCenterButton!.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        self.pathCenterButton!.delegate = self
        self.addSubview(self.pathCenterButton!)

        bottomView = UIView.init(frame: CGRectMake(0, 0, self.bloomSize.width, self.bloomSize.height))
        bottomView.backgroundColor = UIColor.blackColor()
        bottomView.alpha = 0.0

    }

    func createEndPointWithRadius(itemExpandRadius: CGFloat, andAngel angel:CGFloat) -> CGPoint {

        let angelf: Float = Float(angel)

        return CGPointMake(self.pathCenterButtonBloomCenter.x - (CGFloat(cosf(angelf * Float(M_PI))) * itemExpandRadius),
                           self.pathCenterButtonBloomCenter.y - (CGFloat(sinf(angelf * Float(M_PI))) * itemExpandRadius))
    }

    func pathCenterButtonFold() {
        for var index = 1; index <= self.itemButtons?.count; index += 1  {
            let item: DCPathItemButton = self.itemButtons![index - 1] as! DCPathItemButton
            let currentAngel: CGFloat = CGFloat.init(CGFloat(index) / CGFloat((self.itemButtons?.count)! + 1))
            let farPoint: CGPoint = self.createEndPointWithRadius(self.bloomRadius + 5.0, andAngel: currentAngel)

            let foldAnimation: CAAnimationGroup = self.foldAnimationFromPoint(item.center, withFarPoint: farPoint)
            item.layer.addAnimation(foldAnimation, forKey: "foldAnimation")
            item.center = self.pathCenterButtonBloomCenter
        }

        self.bringSubviewToFront(self.pathCenterButton!)
        self.resizeToFoldedFrame()
    }

    func resizeToFoldedFrame() {
        UIView.animateWithDuration(0.0618*3, delay: 0.0618*2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.pathCenterButton!.transform = CGAffineTransformMakeRotation(0)
            }, completion: nil)

        UIView.animateWithDuration(0.1, delay: 0.35, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.bottomView.alpha = 0.0
            }, completion: nil)

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64.init(0.4 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            for item in self.itemButtons!{
                item.performSelector(#selector(UIView.removeFromSuperview))
            }

            self.frame = CGRectMake(0, 0, self.foldedSize.width, self.foldedSize.height)
            self.center = self.foldcenter
            self.pathCenterButton!.center =  CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
            self.bottomView.removeFromSuperview()
        }

        bloom = false
    }

    func foldAnimationFromPoint(endPoint: CGPoint, withFarPoint farPoint: CGPoint) -> CAAnimationGroup {
        /*
         * configure rotation animation
         */
        let rotationAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "transform.rotation.z")
        rotationAnimation.values = [0, M_PI, M_PI*2]
        rotationAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        rotationAnimation.duration = 0.35
        /*
         * configure moving annimation
         */
        let movingAnimation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        let path: CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, endPoint.x, endPoint.y)
        CGPathAddLineToPoint(path, nil, farPoint.x, farPoint.y);
        CGPathAddLineToPoint(path, nil, self.pathCenterButtonBloomCenter.x, self.pathCenterButtonBloomCenter.y);
        movingAnimation.keyTimes = [0.0, 0.75, 1.0]
        movingAnimation.path = path
        movingAnimation.duration = 0.35

        /*
         * merge animation together
         */
        let animations: CAAnimationGroup = CAAnimationGroup()
        animations.animations = [rotationAnimation, movingAnimation]
        animations.duration = 0.35

        return animations
    }
    /*
     * protocol
     */
    func itemButtonTapped(itemButton: DCPathItemButton) {
        let selectedButton: DCPathItemButton = self.itemButtons![itemButton.tag] as! DCPathItemButton
        UIView.animateWithDuration(0.0618 * 5) {
            selectedButton.transform = CGAffineTransformMakeScale(3, 3)
            selectedButton.alpha = 0.0
        }

        for var i = 0; i < self.itemButtons!.count; i += 1 {

            if i == selectedButton.tag {
                continue
            }

            let unselectedButton: DCPathItemButton = self.itemButtons![i] as! DCPathItemButton
            UIView.animateWithDuration(0.0618 * 2, animations: {
                unselectedButton.transform = CGAffineTransformMakeScale(0, 0)
            })
        }

        delgate?.itemButtonTappedAtIndex(itemButton.tag)

        self.resizeToFoldedFrame()
    }

    func centerButtonTapped() {
        if self.bloom{
            self.pathCenterButtonFold()
        } else{
            self.pathCenterButtonBloom()
        }
    }

    func pathCenterButtonBloom() {
        // Configure center button bloom
        //
        // 1. Store the current center point to 'centerButtonBloomCenter
        //
        self.pathCenterButtonBloomCenter = self.center

        // 2. Resize the DCPathButton's frame
        //
        self.frame = CGRectMake(0, 0, self.bloomSize.width, self.bloomSize.height)
        self.center = CGPointMake(self.bloomSize.width / 2, self.bloomSize.height / 2)
        self.insertSubview(self.bottomView, belowSubview: self.pathCenterButton!)
        // 3. Excute the bottom view alpha animation
        //
        UIView.animateWithDuration(0.0618 * 3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.bottomView.alpha = 0.618
            }, completion: nil)

        // 4. Excute the center button rotation animation
        //
        UIView.animateWithDuration(0.1575) { 
            self.pathCenterButton!.transform = CGAffineTransformMakeRotation(CGFloat.init(-0.75 * M_PI))
        }
        self.pathCenterButton?.center = self.pathCenterButtonBloomCenter

        // 5. Excute the bloom animation
        //
        let basicAngel: CGFloat = CGFloat.init( 180 / ((self.itemButtons?.count)! + 1))

        for var i = 1; i <= self.itemButtons!.count; i += 1 {
            let pathItemButton: DCPathItemButton  = self.itemButtons![i - 1] as! DCPathItemButton
            pathItemButton.delegate = self
            pathItemButton.tag = i - 1
            pathItemButton.transform = CGAffineTransformMakeTranslation(1, 1)
            pathItemButton.alpha = 1.0
            // 1. Add pathItem button to the view
            //
            let currentAngel: CGFloat = (basicAngel * CGFloat(i)) / 180
            pathItemButton.center = self.pathCenterButtonBloomCenter
            self.insertSubview(pathItemButton, belowSubview: self.pathCenterButton!)
            // 2.Excute expand animation
            let endPoint: CGPoint = self.createEndPointWithRadius(self.bloomRadius, andAngel: currentAngel)
            let farPoint: CGPoint = self.createEndPointWithRadius(self.bloomRadius + 10.0, andAngel: currentAngel)
            let nearPoint: CGPoint = self.createEndPointWithRadius(self.bloomRadius - 5.0, andAngel: currentAngel)
            let bloomAnimation:CAAnimationGroup = self.bloomAnimationWithEndPoint(endPoint, andFarPoint: farPoint, andNearPoint: nearPoint)
            pathItemButton.layer.addAnimation(bloomAnimation, forKey: "bloomAnimation")
            pathItemButton.center = endPoint
        }

        bloom = true
    }

    func bloomAnimationWithEndPoint(endPoint:CGPoint, andFarPoint farPoint: CGPoint, andNearPoint nearPoint: CGPoint) -> CAAnimationGroup {
        // 1.Configure rotation animation
        let rotationAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "transform.rotation.z")
        rotationAnimation.values = [0.0, -M_PI, -M_PI * 1.5, -M_PI * 2]
        rotationAnimation.duration = 0.3
        rotationAnimation.keyTimes = [0.0, 0.3, 0.6, 1.0]
        // 2.Configure moving animation
        let movingAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")

        let path:CGMutablePathRef  = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, self.pathCenterButtonBloomCenter.x, self.pathCenterButtonBloomCenter.y)
        CGPathAddLineToPoint(path, nil, farPoint.x, farPoint.y)
        CGPathAddLineToPoint(path, nil, nearPoint.x, nearPoint.y)
        CGPathAddLineToPoint(path, nil, endPoint.x, endPoint.y)

        movingAnimation.path = path
        movingAnimation.keyTimes = [0.0, 0.5, 0.7, 1.0]
        movingAnimation.duration = 0.3

        // 3.Merge two animation together
        //
        let animations:CAAnimationGroup = CAAnimationGroup()
        animations.animations = [movingAnimation, rotationAnimation]
        animations.duration = 0.3
        animations.delegate = self

        return animations;
    }
}
