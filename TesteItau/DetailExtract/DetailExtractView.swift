//
//  DetailExtractView.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import UIKit

final class DetailExtractView: UIView {
    
    // MARK: - Properties
    
    private lazy var titleTransactionType: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleTitularName: UILabel = {
        let label = UILabel()
        label.text = "Nome Titular:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var valueTitularName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var titleFavoredName: UILabel = {
        let label = UILabel()
        label.text = "Nome Favorecido:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var valueFavoredName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var titleValeuTransaction: UILabel = {
        let label = UILabel()
        label.text = "valor:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var valeuTransaction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var valueDateTransaction: UILabel = {
        let label = UILabel()
        label.text = "Data:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var dateTransaction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var titleControlTransaction: UILabel = {
        let label = UILabel()
        label.text = "Controle:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var valueControlTransaction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var titleIdTransaction: UILabel = {
        let label = UILabel()
        label.text = "ID da transação:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var valueIdTransaction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var stackTitular: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleTitularName, valueTitularName])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackNamefavored: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleFavoredName, valueFavoredName])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackValueTransaction: UIStackView = {
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
    
    private lazy var stackControlTransaction: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleControlTransaction, valueControlTransaction])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackIdTransaction: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleIdTransaction, valueIdTransaction])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(titleTransactionType)
        addSubview(stackTitular)
        addSubview(stackNamefavored)
        addSubview(stackValueTransaction)
        addSubview(stackDateTransaction)
        addSubview(stackControlTransaction)
        addSubview(stackIdTransaction)
        
        NSLayoutConstraint.activate([
            titleTransactionType.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleTransactionType.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackTitular.topAnchor.constraint(equalTo: titleTransactionType.bottomAnchor, constant: 10),
            stackTitular.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackNamefavored.topAnchor.constraint(equalTo: stackTitular.bottomAnchor, constant: 5),
            stackNamefavored.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackValueTransaction.topAnchor.constraint(equalTo: stackNamefavored.bottomAnchor, constant: 5),
            stackValueTransaction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackDateTransaction.topAnchor.constraint(equalTo: stackValueTransaction.bottomAnchor, constant: 5),
            stackDateTransaction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackControlTransaction.topAnchor.constraint(equalTo: stackDateTransaction.bottomAnchor, constant: 5),
            stackControlTransaction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackIdTransaction.topAnchor.constraint(equalTo: stackControlTransaction.bottomAnchor, constant: 5),
            stackIdTransaction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }
    
    func setupData(data: Receipts) {
        titleTransactionType.text = data.title
        valueTitularName.text = data.name
        valueFavoredName.text = data.receiverName
        valeuTransaction.text = data.amount
        dateTransaction.text = data.date
        valueControlTransaction.text = data.control
        valueIdTransaction.text = data.receiptId
    }
}
