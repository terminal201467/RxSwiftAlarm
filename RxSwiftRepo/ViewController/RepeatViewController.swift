//
//  RepeatViewController.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/23.
//

import UIKit
import RxSwift

enum WeekDay:Int,CaseIterable{
    case mon,tue,wed,thu,fri,sat,sun
    var text:String{
        switch self {
        case .mon: return "MonDay"
        case .tue: return "TuesDay"
        case .wed: return "WednesDay"
        case .thu: return "ThursDay"
        case .fri: return "FriDay"
        case .sat: return "SaturDay"
        case .sun: return "SunDay"
        }
    }
}

class RepeatViewController: UIViewController {
    
    //MARK: -TableView
    private let table:UITableView = {
       let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelection = true
        return tableView
    }()
    
    //MARK: -WeekDayChoose
    private var weekDayChooseObservable = Observable.just(Set<WeekDay>())
    
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
    
    private func setTableViewCells(){
        weekDayChooseObservable
            .bind(to: table.rx.items(cellIdentifier: "Cell", cellType:UITableViewCell.self){ (row,cell,element) in
                
                
                return cell
            }
        
    }
    
    private func setTableViewSelect(){
        
    }
}
