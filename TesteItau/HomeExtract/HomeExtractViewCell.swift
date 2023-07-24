//
//  HomeExtractViewCell.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 21/07/23.
//

import UIKit

final class HomeExtractViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private lazy var titleTransactionType: UILabel = {
        let label = UILabel()
        label.text = "Transferência"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleFavoredName: UILabel = {
        let label = UILabel()
        label.text = "Nome Favorecido:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueFavoredName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleValeuTransaction: UILabel = {
        let label = UILabel()
        label.text = "valor:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valeuTransaction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueDateTransaction: UILabel = {
        let label = UILabel()
        label.text = "Data:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateTransaction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackNamefavored: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleFavoredName, valueFavoredName])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackValeuTransaction: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleValeuTransaction, valeuTransaction])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackDateTransaction: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [valueDateTransaction, dateTransaction])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(titleTransactionType)
        addSubview(stackNamefavored)
        addSubview(stackValeuTransaction)
        addSubview(stackDateTransaction)
        
        NSLayoutConstraint.activate([
            titleTransactionType.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            titleTransactionType.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackNamefavored.topAnchor.constraint(equalTo: titleTransactionType.bottomAnchor, constant: 10),
            stackNamefavored.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackValeuTransaction.topAnchor.constraint(equalTo: stackNamefavored.bottomAnchor, constant: 5),
            stackValeuTransaction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackDateTransaction.topAnchor.constraint(equalTo: stackValeuTransaction.bottomAnchor, constant: 5),
            stackDateTransaction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func setupDataCell(data: Receipts) {
        titleTransactionType.text = data.title
        valueFavoredName.text = data.receiverName
        valeuTransaction.text = data.amount
        dateTransaction.text = data.date
    }
}
