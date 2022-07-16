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
        navigationItem.title = "Qiitaの記事"
        
        getQiitaApi()
        
    }
    
    private func getQiitaApi() {
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=1") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url) { (data,response, err) in
            if let err = err {
                print("情報の取得に失敗しました。：", err)
                return
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    print("json：", json)
                } catch(let err) {
                    print("情報の取得に失敗しました。：", err)
                }
            }
        }
        task.resume()
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
