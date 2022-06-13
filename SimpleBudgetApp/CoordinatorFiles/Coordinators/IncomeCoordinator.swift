//
//  IncomeCoordinator.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class IncomeCoordinator: Coordinator, Incomeable {
    var childCoordinators: [Coordinator] = []
    private weak var parentCoordinator: MainCoordinatable?
    private var navController: UINavigationController

    init(parentCoordinator: MainCoordinator, navController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navController = navController
    }

    func start() {
        let incomeVC = IncomeViewController()
        incomeVC.coordinator = self

        pushVC(incomeVC, onNavController: navController, hidesNavBar: true)
    }
}
