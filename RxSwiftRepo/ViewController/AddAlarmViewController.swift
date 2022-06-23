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
}

class AddAlarmViewController: UIViewController {
    //MARK: - UIProperties
    private let addAlarmView = AddAlarmView()
    
    
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
        setTableView()
        setTableCellItem()
        setTableViewItemSelect()
    }
    
    //MARK: - setNavigationBar
    private func setNavigationBar(){
        title = "Create Alarm"
        navigationController?.navigationBar.prefersLargeTitles = false
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func save(){
        
    }
    
    @objc func cancel(){
        
    }
    
    //MARK: -setTalbleView
    private func setTableView(){
        addAlarmView.table.delegate = self
    }
    
    private func setTableCellItem(){
        cellNames
            .bind(to: addAlarmView.table.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){(_,cellName:CellName,cell:UITableViewCell) in
                cell.textLabel?.text = cellName.text
            }
            .disposed(by: disposeBag)
    }
    
    private func setTableViewItemSelect(){
        addAlarmView.table.rx.itemSelected.subscribe { indexPath in
            print("選中的indexPath:\(indexPath.row)")
            guard let cellNames = CellName(rawValue: indexPath.row)else{ return }
            switch cellNames {
            case .repeats:
                print("repeat")
            case .label:
                print("label")
            case .alert:
                print("alert")
            case .remindLater:
                print("remindLater")
            }
        } onError: { error in
            print("\(error)")
        } onCompleted: {
            print("completed")
        } onDisposed: {
            print("disposed")
        }.disposed(by: disposeBag)
    }
}

extension AddAlarmViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellName.allCases.count
    }
}
