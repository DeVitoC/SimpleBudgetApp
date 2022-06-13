//
//  IncomeView.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class IncomeView: UIView {
    // MARK: Properties

    // MARK: UI Elements

    // MARK: Inits
    init() {
        super.init(frame: .zero)

        let label = UILabel()
        label.text = "Income"
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
