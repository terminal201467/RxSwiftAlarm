//
//  ViewController.swift
//  RxSwiftRepo
//
//  Created by 辴 穆 on 2022/6/1.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -Properties
    private let tables = View.init()
    
    private var store:[String] = []
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = tables
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    //MARK: - Methods

    private func setTableView(){
        tables.table.delegate = self
        tables.table.dataSource = self
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    
    
}

