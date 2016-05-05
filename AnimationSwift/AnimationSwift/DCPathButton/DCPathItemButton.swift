//
//  DCPathItemButton.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/4.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit


protocol DCPathItemButtonDelegate: NSObjectProtocol {
    func itemButtonTapped(itemButton: DCPathItemButton)
}

class DCPathItemButton: UIImageView {

    weak var delegate: DCPathItemButtonDelegate?
    var index: Int = 0
    var backgroundImageView: UIImageView?

    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(image: UIImage?, highlightedImage: UIImage?, backgroudImage: UIImage?, backgroundHigtlightedImage: UIImage?) {
        super.init(frame: CGRectZero)

        var itemFrame: CGRect = CGRectMake(0, 0, (backgroudImage?.size.width)!, (backgroudImage?.size.height)!)

        if backgroudImage == nil || backgroundHigtlightedImage == nil  {
            itemFrame = CGRectMake(0, 0, (image?.size.width)!, (image?.size.height)!)
        }

        self.index = 0
        self.frame = itemFrame
        self.image = backgroudImage
        self.highlightedImage = backgroundHigtlightedImage
        self.userInteractionEnabled = true
        backgroundImageView = UIImageView.init(image: image, highlightedImage: highlightedImage)
        backgroundImageView!.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
        self.addSubview(backgroundImageView!)

    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.highlighted = true
        self.backgroundImageView?.highlighted = true
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let currentLocation: CGPoint = (touches.first?.locationInView(self))!

        if !CGRectContainsPoint(self.scaleRect(self.bounds), currentLocation) {
            self.highlighted = false
            self.backgroundImageView?.highlighted = false
            return
        }

        self.highlighted = true
        self.backgroundImageView?.highlighted = true
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        delegate?.itemButtonTapped(self)
        self.highlighted = false
        self.backgroundImageView?.highlighted = false
    }

    func scaleRect(originRect:CGRect) -> CGRect{
    return CGRectMake(-originRect.size.width * 2, -originRect.size.height * 2, originRect.size.width * 5,originRect.size.height * 5);
    }
}
