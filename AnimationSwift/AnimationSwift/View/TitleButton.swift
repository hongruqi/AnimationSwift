//
//  TitleButton.swift
//  AnimationSwift
//
//  Created by qihongru on 16/4/27.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

public class TitleButton: UIButton {

    public func initWithFrame(frame: CGRect, title: String) -> TitleButton {
        self.frame = frame;
        self.setTitle(title, forState: UIControlState.Normal)
        self.backgroundColor = UIColor.grayColor()
        return self
    }

}
