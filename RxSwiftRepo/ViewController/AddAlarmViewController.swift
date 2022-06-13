//
//  AddAlarmViewController.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/13.
//

import UIKit

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

    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = addAlarmView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
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
        addAlarmView.table.dataSource = self
    }
}

extension AddAlarmViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
}
