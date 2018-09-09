//
//  ViewController.swift
//  XCTopMenuViewTest
//
//  Created by myxc on 2018/9/9.
//  Copyright © 2018 myxc. All rights reserved.
//

import UIKit
import XCTopMenuView

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let titles = ["one", "two", "three"]
        let controllers = [MenuController(), MenuController(), MenuController()]
        let menuView = MenuView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - 64), titles: titles, childViewControllers: controllers)
        self.view.addSubview(menuView)
        
    }

}

