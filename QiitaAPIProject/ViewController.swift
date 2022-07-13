//
//  ViewController.swift
//  QiitaAPIProject
//
//  Created by 今橋浩樹 on 2022/07/14.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellId = "cellId"
    
    let tableView: UITableView = {
        let tv = UITableView()
            return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame.size = view.frame.size
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}
