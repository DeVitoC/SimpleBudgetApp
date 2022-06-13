//
//  AccountsCoordinator.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class AccountsCoordinator: Coordinator, Accountable {
    var childCoordinators: [Coordinator] = []
    private weak var parentCoordinator: MainCoordinatable?
    private var navController: UINavigationController

    init(parentCoordinator: MainCoordinatable, navController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navController = navController
    }

    func start() {
        let accountsVC = AccountsMainViewController()
        accountsVC.coordinator = self

        pushVC(accountsVC, onNavController: navController, hidesNavBar: true)
    }
}
