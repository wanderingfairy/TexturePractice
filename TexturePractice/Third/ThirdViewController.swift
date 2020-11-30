//
//  ThirdViewController.swift
//  TexturePractice
//
//  Created by xlab on 2020/11/30.
//

import UIKit
import SnapKit
import Then

class ThirdViewController: UIViewController {
    
    lazy var tableView = UITableView().then {
        $0.rowHeight = 98
    }
    let messages = dummyMessages
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Third"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(view.safeAreaLayoutGuide.snp.height)
            $0.centerX.equalToSuperview()
        }
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell
        cell?.configure(message: self.messages[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
