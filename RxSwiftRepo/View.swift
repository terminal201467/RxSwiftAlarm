//
//  View.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/13.
//

import UIKit
import SnapKit

class View: UIView {

    let table:UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelection = true
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(table)
        autoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        
    }

}
