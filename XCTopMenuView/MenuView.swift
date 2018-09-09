//
//  MenuView.swift
//  AppTest
//
//  Created by myxc on 2018/9/9.
//  Copyright © 2018 myxc. All rights reserved.
//

import UIKit

public class MenuView: UIView {

    
    /// 头部标题 titles
    private (set) public var titles: [String]
    
    //body content
    private (set) public var childViewControllers: [UIViewController]
    
    fileprivate var headerView:TopView?
    fileprivate var content: UIScrollView? //bodyView
    
    public init(frame: CGRect, titles: [String], childViewControllers: [UIViewController]) {
        self.titles = titles
        self.childViewControllers = childViewControllers
        super.init(frame: frame)
        
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuView: TopViewDelegate, UIScrollViewDelegate {
    
    private func setupUI() {
        headerView = TopView.init(frame: CGRect.init(x: 0, y: 64, width: ScreenWidth, height: 40), titles: titles as NSArray)
        self.addSubview(headerView!)
        headerView?.delegate = self as TopViewDelegate
        
        content = UIScrollView.init(frame: CGRect.init(x: 0, y: (headerView?.bounds.height)! + 64, width: ScreenWidth, height: ScreenHeight - (headerView?.bounds.height)!))
        self.addSubview(content!)
        content?.delegate = self as UIScrollViewDelegate
        content?.contentSize = CGSize.init(width: CGFloat(titles.count) * ScreenWidth, height: (self.content?.bounds.height)!)
        content?.isPagingEnabled = true
        
        for i in 0..<childViewControllers.count {
            let view = childViewControllers[i].view
            content?.addSubview(view!)
            view?.frame = CGRect.init(x: CGFloat(i) * ScreenWidth, y: 0, width: ScreenWidth, height: (content?.bounds.height)!)
        }
        
    }
    
    /// offset changes
    ///
    /// - Parameter scrollView: scrollView
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.headerView?.moveBottomLine(index: Int(scrollView.contentOffset.x/ScreenWidth))
    }
    
    /// TopViewDelegate
    ///
    /// - Parameter index: header Index
    func moveContent(index: Int) {
        UIView.animate(withDuration: animTime) {
            self.content?.contentOffset = CGPoint.init(x: CGFloat(index) * ScreenWidth, y: 0)
        }
    }
    
}
