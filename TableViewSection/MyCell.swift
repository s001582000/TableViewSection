//
//  MyCell.swift
//  TableViewSection
//
//  Created by 梁雅軒 on 2017/3/16.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

enum TouchEvent {
    case greenBtn,redBtn
}
class MyCell: UITableViewCell {
    typealias Block = (MyCell,IndexPath,TouchEvent) -> Void
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var btn2: UIButton!
    @IBOutlet private weak var btn1: UIButton!
    private var mIndexPath:IndexPath!
    var block:Block?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInfo(info:MyInfo,indexPath:IndexPath) {
        mIndexPath = indexPath
        lblName.text = info.name
    }
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        if sender == btn1 {
            block?(self, mIndexPath, .greenBtn)
        } else if sender == btn2{
            block?(self, mIndexPath, .redBtn)
        }
    }
    
}
