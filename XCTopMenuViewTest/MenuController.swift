//
//  MenuController.swift
//  XCTopMenuViewTest
//
//  Created by myxc on 2018/9/9.
//  Copyright © 2018 myxc. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell")
        let vc = MenuController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("aaaaaaaa")
    }
    
}
