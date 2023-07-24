//
//  HomeExtractView.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 21/07/23.
//

import UIKit

protocol HomeExtractViewDelegate: AnyObject {
    func clickExtract(data: Receipts)
}

final class HomeExtractView: UIView {
    
    // MARK: - Properties
    
    private let cellExtract = "cellExtract"
    private var data: [Receipts] = []
    weak var delegate: HomeExtractViewDelegate?
    
    private lazy var tableListExtract: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(HomeExtractViewCell.self, forCellReuseIdentifier: cellExtract)
        table.rowHeight = 100
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        backgroundColor = .white
        
        addSubview(tableListExtract)
        
        NSLayoutConstraint.activate([
            tableListExtract.topAnchor.constraint(equalTo: topAnchor),
            tableListExtract.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableListExtract.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableListExtract.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupData(data: [Receipts]) {
        self.data = data
        tableListExtract.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension HomeExtractView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellExtract, for: indexPath) as! HomeExtractViewCell
        cell.selectionStyle = .none
        cell.setupDataCell(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.clickExtract(data: data[indexPath.row])
    }
}
