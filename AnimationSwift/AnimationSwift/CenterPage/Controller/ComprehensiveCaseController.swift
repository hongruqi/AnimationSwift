//
//  ComprehensiveCaseController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/5/5.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

class ComprehensiveCaseController: BaseViewController, DCPathButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            return ["Path", "钉钉", "点赞"]
        }
    }

    override func clickBtn(btn: UIButton) {
        switch btn.tag {
        case 0:
            self.pathAnimation()
        default:
            break
        }
    }

    var pathAnimationView: DCPathButton?

    func pathAnimation (){
        if pathAnimationView == nil {
            self .configureDCPathButton()
        }else{
            pathAnimationView?.hidden = false
        }

    }

    func configureDCPathButton () {
        let  dcPathButton: DCPathButton = DCPathButton.init(centerImage: UIImage.init(named: "chooser-button-tab")!, hilightedImage: UIImage.init(named: "chooser-button-tab-highlighted")!)
        pathAnimationView = dcPathButton
        dcPathButton.delgate = self
        let itemButton_1: DCPathItemButton = DCPathItemButton.init(image: UIImage.init(named: "chooser-moment-icon-music")!, highlightedImage: UIImage.init(named: "chooser-moment-icon-music-highlighted")!, backgroudImage: UIImage.init(named: "chooser-moment-button")!, backgroundHigtlightedImage: UIImage.init(named: "chooser-moment-button-highlighted")!)
        let itemButton_2: DCPathItemButton = DCPathItemButton.init(image: UIImage.init(named: "chooser-moment-icon-place")!, highlightedImage: UIImage.init(named: "chooser-moment-icon-place-highlighted")!, backgroudImage: UIImage.init(named: "chooser-moment-button")!, backgroundHigtlightedImage: UIImage.init(named: "chooser-moment-button-highlighted")!)
        let itemButton_3: DCPathItemButton = DCPathItemButton.init(image: UIImage.init(named: "chooser-moment-icon-camera")!, highlightedImage: UIImage.init(named: "chooser-moment-icon-camera-highlighted")!, backgroudImage: UIImage.init(named: "chooser-moment-button")!, backgroundHigtlightedImage: UIImage.init(named: "chooser-moment-button-highlighted")!)
        let itemButton_4: DCPathItemButton = DCPathItemButton.init(image: UIImage.init(named: "chooser-moment-icon-thought")!, highlightedImage: UIImage.init(named: "chooser-moment-icon-thought-highlighted")!, backgroudImage: UIImage.init(named: "chooser-moment-button")!, backgroundHigtlightedImage: UIImage.init(named: "chooser-moment-button-highlighted")!)
        let itemButton_5: DCPathItemButton = DCPathItemButton.init(image: UIImage.init(named: "chooser-moment-icon-sleep")!, highlightedImage: UIImage.init(named: "chooser-moment-icon-sleep-highlighted")!, backgroudImage: UIImage.init(named: "chooser-moment-button")!, backgroundHigtlightedImage: UIImage.init(named: "chooser-moment-button-highlighted")!)
        dcPathButton.addPathItems([itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5])
        self.view.addSubview(dcPathButton)
    }

    // DCPathButton Delegate
    func itemButtonTappedAtIndex(index: Int) {
        print("You tap at index : \(index)")
    }
}
