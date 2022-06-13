//
//  QuickLookCoordinator.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class QuickLookCoordinator: Coordinator, QuickLookable {
    var childCoordinators: [Coordinator] = []
    private weak var parentCoordinator: MainCoordinatable?
    private var navController: UINavigationController

    init(parentCoordinator: MainCoordinatable, navController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navController = navController
    }

    func start() {
        let quickLookVC = QuickLookViewController()
        quickLookVC.coordinator = self

        pushVC(quickLookVC, onNavController: navController, hidesNavBar: true)
    }


}
