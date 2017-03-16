//
//  ViewController.swift
//  TableViewSection
//
//  Created by 梁雅軒 on 2017/3/16.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrData = [[String]]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        
        tableView.register(UINib(nibName:"MyHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "MyHeaderView")
        for i in 1...3 {
            var arrStr = [String]()
            for j in 1...arc4random() % 20 + 1 {
                arrStr.append("\(i),\(j)")
            }
            arrData.append(arrStr)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.section+1)-\(indexPath.row+1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyHeaderView") as! MyHeaderView
        headerView.lblSection.text = "\(section + 1)"
        
        headerView.lblSectionTitle.text = "這是第\(section+1)欄"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    

}
