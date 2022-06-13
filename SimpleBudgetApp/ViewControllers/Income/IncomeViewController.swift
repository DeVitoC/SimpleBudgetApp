//
//  IncomeViewController.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class IncomeViewController: UIViewController {
    // MARK: Properties
    private let incomeView = IncomeView()
    weak var coordinator: Incomeable?

    // MARK: View Lifecycle
    override func loadView() {
        view = incomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
