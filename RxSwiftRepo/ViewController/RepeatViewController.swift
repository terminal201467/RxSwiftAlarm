//
//  RepeatViewController.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/23.
//

import UIKit

class RepeatViewController: UIViewController {
    
    //MARK: -TableView
    private let table:UITableView = {
       let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelection = true
        return tableView
    }()
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view.addSubview(table)
        table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
