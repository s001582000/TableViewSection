//
//  ViewController.swift
//  TableViewSection
//
//  Created by 梁雅軒 on 2017/3/16.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrData = [[MyInfo]]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        
        tableView.register(UINib(nibName:"MyHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "MyHeaderView")
        for i in 1...3 {
            var arrStr = [MyInfo]()
            for j in 1...arc4random() % 20 + 1 {
                let info = MyInfo()
                info.name = "\(i)-\(j)"
                info.index = Int(j)
                arrStr.append(info)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        let info = arrData[indexPath.section][indexPath.row]
        cell.setInfo(info: info, indexPath: indexPath)
        cell.block = {(cell:MyCell,indexPath:IndexPath,event:TouchEvent) in
            let touchInfo = self.arrData[indexPath.section][indexPath.row]
            print(touchInfo.name)
            print(cell)
            print(indexPath)
            print(event)
        }
        
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

class MyInfo {
    var name:String!
    var index:Int!
}
class MySuperView: UIView {
    override func draw(_ rect: CGRect) {
        self.layoutIfNeeded()
    }
}
