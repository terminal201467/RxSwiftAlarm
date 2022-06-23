//
//  AddAlarmViewController.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/13.
//

import UIKit
import RxSwift
import RxCocoa

enum CellName:Int,CaseIterable{
    case repeats = 0,label,alert,remindLater
    var text:String{
        switch self{
        case .repeats:     return "Repeat"
        case .label:       return "Label"
        case .alert:       return "Alert"
        case .remindLater: return "RemindLater"
        }
    }
    var controller:UIViewController{
        switch self{
        case .repeats:     return RepeatViewController()
        case .label:       return LabelViewController()
        case .alert:       return AlertViewController()
        case .remindLater: return UIViewController()
        }
    }
}

class AddAlarmViewController: UIViewController {
    //MARK: - Properties
    
    private var repeatTime:String = "永不"
    
    private var alarmName:String = "鬧鐘"
    
    private var remindSoundName:String = "山坡"
    
    //MARK: - UIProperties
    private let addAlarmView = AddAlarmView()
    
    private lazy var dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        return formatter
    }()
    
    //MARK: - Controllers
    
    //MARK: - DataProperties
    
    private let cellNames = Observable.just(CellName.allCases)
    
    private let disposeBag = DisposeBag()
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = addAlarmView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setDatePicker()
        setTableCellItem()
        setTableViewItemSelect()
    }
    
    //MARK: - setNavigationBar
    private func setNavigationBar(){
        title = "Create Alarm"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        addAlarmView.saveBarButton.rx.tap
            .subscribe(onNext:  { [weak self] in
            self?.dismiss(animated: true)
        })
        .disposed(by: disposeBag)
        
        addAlarmView.cancelBarButton.rx.tap
            .subscribe(onNext:  { [weak self] in
            self?.dismiss(animated: true)
        })
        .disposed(by: disposeBag)
        
        navigationItem.rightBarButtonItem = addAlarmView.saveBarButton
        navigationItem.leftBarButtonItem = addAlarmView.cancelBarButton
    }
    
    //MARK: -setDatePicker
    private func setDatePicker(){
        addAlarmView.datePicker.rx.date
            .map { [weak self] in
                "當前選擇時間" + self!.dateFormatter.string(from: $0)
            }
    }
    
    //MARK: -setTableView
    private func setTableCellItem(){
        cellNames
            .bind(to: addAlarmView.table.rx.items(cellIdentifier: "Cell",
                                                  cellType: UITableViewCell.self)){(element,cellName,cell) in
                guard let cellName = CellName(rawValue:element) else { return }
                switch cellName {
                case .repeats:
                    cell.textLabel?.text = cellName.text
                    cell.detailTextLabel?.text = self.repeatTime
                    cell.accessoryType = .disclosureIndicator
                case .label:
                    cell.textLabel?.text = cellName.text
                    cell.detailTextLabel?.text = self.alarmName
                    cell.accessoryType = .disclosureIndicator
                case .alert:
                    cell.textLabel?.text = cellName.text
                    cell.detailTextLabel?.text = self.remindSoundName
                    cell.accessoryType = .disclosureIndicator
                case .remindLater:
                    cell.textLabel?.text = cellName.text
                    cell.accessoryView = self.addAlarmView.remindLaterSwitch
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func setTableViewItemSelect(){
        addAlarmView.table.rx.itemSelected.subscribe {indexPath in
            guard let cellNames = CellName(rawValue: indexPath.element!.row)else{ return }
            switch cellNames {
            case .repeats:      self.navigationController?.pushViewController(cellNames.controller, animated: true)
            case .label:        self.navigationController?.pushViewController(cellNames.controller, animated: true)
            case .alert:        self.navigationController?.pushViewController(cellNames.controller, animated: true)
            case .remindLater:  print("remindLater")
            }
        }
    }
}
