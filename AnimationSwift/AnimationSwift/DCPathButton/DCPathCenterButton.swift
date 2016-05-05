//
//  DCPathCenterButton.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/4.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

protocol DCPathCenterButtonDelegate: NSObjectProtocol {
    func centerButtonTapped()
}

class DCPathCenterButton: UIImageView {

    weak var delegate: DCPathCenterButtonDelegate?

    override init(image: UIImage?, highlightedImage: UIImage?){
        super.init(image: image, highlightedImage: highlightedImage)
        self.userInteractionEnabled = true
        self.image = image
        self.highlightedImage = highlightedImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func scaleRect (originRect: CGRect) -> CGRect {
        return CGRectMake(-originRect.size.width, -originRect.size.height, originRect.size.width * 3, originRect.size.height * 3)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.highlighted = true
        delegate?.centerButtonTapped()
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let currentLocation: CGPoint = (touches.first?.locationInView(self))!

        if !CGRectContainsPoint(self.scaleRect(self.bounds), currentLocation){
            self.highlighted = false
            return
        }

        self.highlighted = true
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.highlighted = false
    }

}