//
//  LeftViewController.swift
//  AnimationSwift
//
//  Created by qihongru on 16/4/28.
//  Copyright © 2016年 qihongru. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var menuArray: NSArray = []

    func initData() {
        self.menuArray = ["基础动画", "关键帧动画", "组动画", "过渡动画", "仿射变换", "综合案例"]
    }

    func initView() {
        self.view.backgroundColor = UIColor.lightGrayColor()
        tableView = UITableView.init(frame: CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20), style: UITableViewStyle.Grouped)
        tableView!.delegate = self
        tableView!.dataSource = self
        self.view.addSubview(tableView!)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let TABLE_VIEW_ID: String = "table_view_id"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(TABLE_VIEW_ID)

        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: TABLE_VIEW_ID)
        }

        cell?.textLabel?.text = menuArray[indexPath.row] as? String

        return cell!
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let revealViewController: SWRevealViewController = self.revealViewController()

        var viewController: UIViewController? = nil

        switch indexPath.row {
            case 0:
                viewController = BaseAnimationController()
            case 1:
                viewController = KeyFrameAnimationController()
            case 2:
                viewController = GroupAnimationController()
            case 3:
                viewController = TransitionAnimationController()
            case 4:
                viewController = AffineTransformController()
            case 5:
                viewController = ComprehensiveCaseController()
            default:
                break
        }

        revealViewController.pushFrontViewController(viewController, animated: true)
    }

}
