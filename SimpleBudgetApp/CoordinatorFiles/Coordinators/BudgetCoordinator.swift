//
//  BudgetCoordinator.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class BudgetCoordinator: Coordinator, Budgetable {
    var childCoordinators: [Coordinator] = []
    private weak var parentCoordinator: MainCoordinatable?
    private var navController: UINavigationController

    init(parentCoordinator: MainCoordinatable, navController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navController = navController
    }

    func start() {
        let budgetVC = MonthlyBudgetViewController()
        budgetVC.coordinator = self

        pushVC(budgetVC, onNavController: navController, hidesNavBar: true)
    }
}
