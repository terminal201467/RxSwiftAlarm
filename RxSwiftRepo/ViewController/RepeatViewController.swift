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
    private var weekDayObservable = Observable.just(WeekDay.allCases)
    
    private let disposeBag = DisposeBag()
    
//    private var checkDay:Bool = false
    
    private var chooseDay = BehaviorSubject(value: [WeekDay]())
    
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
        setTableView()
        setTableViewSelect()
        setTableViewWillDisplay()
    }
    
    private func setTableView(){
        weekDayObservable
            .bind(to: table.rx.items){ (tableView,row,element) in
                let cell = self.table.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(row):\(element)"
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func setTableViewSelect(){
        table.rx.itemSelected.subscribe { indexPath in
            print("選中的row:\(indexPath.element?.row)")
//            self.checkDay.toggle()
            guard let weekCell = WeekDay(rawValue: indexPath.element!.row) else { return }
            switch weekCell {
            case .mon: chooseDay
            case .tue:
                <#code#>
            case .wed:
                <#code#>
            case .thu:
                <#code#>
            case .fri:
                <#code#>
            case .sat:
                <#code#>
            case .sun:
                <#code#>
            }
        }.disposed(by: disposeBag)
    }
    
    private func setTableViewWillDisplay(){
        table.rx.willDisplayCell.subscribe { (cell,indexPath) in
            print("WillDisplay")
            
            
//            if self.checkDay == true{
//                cell.accessoryType = .checkmark
//            }else{
//                cell.accessoryType = .none
//            }
        }
        .disposed(by: disposeBag)
    }
}
