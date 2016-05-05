//
//  MCFireworksView.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/5.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

class MCFireworksView: UIView {
    var particleImage: UIImage
    var particleScale: CGFloat
    var particleScaleRange: CGFloat
    var explosionLayer: CAEmitterLayer

    func setup () {
        self.clipsToBounds = false
        self.userInteractionEnabled = false
        let explosionCell: CAEmitterCell = CAEmitterCell()
        explosionCell.name = "explosion"
        explosionCell.alphaRange = 0.20
        explosionCell.alphaSpeed = -1.0
        explosionCell.lifetime = 0.7
        explosionCell.lifetimeRange = 0.3
        explosionCell.birthRate = 0
        explosionCell.velocity = 40.00
        explosionCell.velocityRange = 10.00

        explosionLayer = CAEmitterLayer()
        explosionLayer.name = "emitterLayer"
        explosionLayer.emitterShape = kCAEmitterLayerCircle
        explosionLayer.emitterMode = kCAEmitterLayerOutline
        explosionLayer.emitterSize = CGSizeMake(25, 0)
        explosionLayer.emitterCells = [explosionCell]


    }
}
