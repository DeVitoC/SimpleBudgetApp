//
//  AccountsMainView.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class AccountsMainView: UIView {
    // MARK: Properties

    // MARK: UI Elements

    // MARK: Inits
    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        let label = UILabel()
        label.text = "Accounts"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
}
