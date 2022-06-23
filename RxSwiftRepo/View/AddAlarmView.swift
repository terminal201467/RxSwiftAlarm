//
//  AddAlarmView.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/13.
//

import UIKit
import SnapKit

class AddAlarmView: UIView {

    let datePicker:UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    let table:UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelection = true
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    let remindLaterSwitch:UISwitch = {
        let remindLaterSwitch = UISwitch()
        remindLaterSwitch.isOn = true
        return remindLaterSwitch
    }()
    
    //MARK: -Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(remindLaterSwitch)
        addSubview(datePicker)
        addSubview(table)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -AutoLayout
    private func autoLayout(){
        datePicker.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.4)
        }
        
        table.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
