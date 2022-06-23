//
//  ViewController.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/1.
//

import UIKit
import RxSwift

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: -Properties
    private let tables = View.init()
    
    private let storeObservable = Observable.just([Alarm]())
    
    private let addAlarmViewController = UINavigationController(rootViewController: AddAlarmViewController())
    
    private let disposeBag = DisposeBag()
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = tables
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableViewCellItem()
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
    
    private func setTableViewCellItem(){
        storeObservable
            .bind(to:tables.table.rx.items(cellIdentifier: "Cell",
                                           cellType: UITableViewCell.self)){(row,element,cell) in
                cell.textLabel?.text = "\(row):\(element)"
            }
            .disposed(by: disposeBag)
    }
}

