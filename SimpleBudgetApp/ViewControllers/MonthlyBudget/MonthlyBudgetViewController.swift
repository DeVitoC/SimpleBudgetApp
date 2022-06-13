//
//  MonthlyBudgetViewController.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class MonthlyBudgetViewController: UIViewController {
    // MARK: Properties
    private let monthlyBudgetView = MonthlyBudgetView()
    weak var coordinator: Budgetable?

    // MARK: View Lifecycle
    override func loadView() {
        view = monthlyBudgetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
