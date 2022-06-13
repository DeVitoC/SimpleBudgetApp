//
//  MainCoordinator.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 5/29/22.
//

import UIKit

class MainCoordinator: Coordinator, MainCoordinatable {
    var childCoordinators: [Coordinator] = []
    private let navController: UINavigationController
    private var mainTabBar: MainTabBarController?
    let hasPhysicalButton: Bool

    init(navController: UINavigationController, hasPhysicalButton: Bool) {
        self.navController = navController
        self.hasPhysicalButton = hasPhysicalButton
    }

    func start() {
        let mainTabBarController = MainTabBarController(coordinator: self, hasPhysicalButton: hasPhysicalButton)
        mainTabBar = mainTabBarController

        pushVC(mainTabBarController,
               onNavController: navController,
               hidesNavBar: true)
    }

    func createTabBarCoordinators(completion: @escaping ([UIViewController]) -> Void) {
        let accountNavController = createAccountsCoordinator()
        let incomeNavController = createIncomeCoordinator()
        let budgetNavController = createBudgetCoordinator()
        let quickLookNavController = createQuickLookCoordinator()

        let tabViewControllers = [accountNavController, incomeNavController, budgetNavController, quickLookNavController]
        completion(tabViewControllers)
    }

    // MARK: Helper Methods
    private func createAccountsCoordinator() -> UINavigationController {
        let navController = UINavigationController()
        let accountsCoordinator = AccountsCoordinator(parentCoordinator: self, navController: navController)
        childCoordinators.append(accountsCoordinator)
        accountsCoordinator.start()
        return navController
    }

    private func createIncomeCoordinator() -> UINavigationController {
        let navController = UINavigationController()
        let incomeCoordinator = IncomeCoordinator(parentCoordinator: self, navController: navController)
        childCoordinators.append(incomeCoordinator)
        incomeCoordinator.start()
        return navController
    }

    private func createBudgetCoordinator() -> UINavigationController {
        let navController = UINavigationController()
        let budgetCoordinator = BudgetCoordinator(parentCoordinator: self, navController: navController)
        childCoordinators.append(budgetCoordinator)
        budgetCoordinator.start()
        return navController
    }

    private func createQuickLookCoordinator() -> UINavigationController {
        let navController = UINavigationController()
        let quickLookCoordinator = QuickLookCoordinator(parentCoordinator: self, navController: navController)
        childCoordinators.append(quickLookCoordinator)
        quickLookCoordinator.start()
        return navController
    }
}
