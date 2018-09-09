//
//  TopView.swift
//  AppTest
//
//  Created by myxc on 2018/9/7.
//  Copyright © 2018 myxc. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

/// 动画时间
let animTime = 0.3

protocol TopViewDelegate: NSObjectProtocol {
    
    func moveContent(index:Int)
    
}

class TopView: UIView {

    var delegate:TopViewDelegate?
    
    var titles:NSArray?
    var bottomLineView:UIView?//topView下划线
    
    init(frame: CGRect, titles:NSArray) {
        super.init(frame: frame)
        self.titles = titles
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let btnWidth = ScreenWidth/CGFloat((self.titles?.count)!)
        
        for i in 0..<(self.titles?.count as! Int) {
            let btn = UIButton.init(type: .custom)
            self.addSubview(btn)
            btn.frame = CGRect.init(x: CGFloat(i) * btnWidth, y: 0, width: btnWidth, height:39)
            btn.tag = i
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setTitle((self.titles![i] as! String), for: .normal)
            btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        }
        
        bottomLineView = UIView()
        self.addSubview(bottomLineView!)
        bottomLineView?.frame = CGRect.init(x: 0, y: self.bounds.height - 1, width: btnWidth, height: 1)
        bottomLineView?.backgroundColor = UIColor.purple
        
    }
    
    @objc func btnClick(btn:UIButton) {
        print("btn : \(btn.tag)")
        moveBottomLine(index: btn.tag)
        delegate?.moveContent(index: btn.tag)
    }
    
    func moveBottomLine(index:Int) {
        let btnWidth = ScreenWidth/CGFloat((self.titles?.count)!)
        UIView.animate(withDuration: animTime) {
            self.bottomLineView?.frame = CGRect.init(x: CGFloat(index) * btnWidth , y: self.bounds.height - 1, width: btnWidth, height: 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
