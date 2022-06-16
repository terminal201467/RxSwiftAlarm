//
//  ViewController.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/1.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    //MARK: -Properties
    private let tables = View.init()
    
    private let storeObservable = Observable.just([Alarm].self)
    
    private let addAlarmViewController = AddAlarmViewController()
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = tables
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
    }
    
    //MARK: - setNavigationBar
    private func setNavigationBar(){
        title = "Alarm"
        navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit))

        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = editButton
    }
    
    @objc func add(){
        present(addAlarmViewController, animated: true)
    }
    
    @objc func edit(){
        
    }
    
    //MARK: -setTableView
    private func setTableView(){
        tables.table.delegate = self
    }
    
    private func setTableViewCellItem(){
        store
            .
    }

}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.count
    }
    
    
    
}

