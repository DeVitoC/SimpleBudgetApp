//
//  Coordinator.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 5/29/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }

    func start()
    func pushVC(_ viewController: UIViewController,
                onNavController navController: UINavigationController,
                hidesNavBar: Bool)
}

extension Coordinator {
    func pushVC(_ viewController: UIViewController,
                onNavController navController: UINavigationController,
                hidesNavBar: Bool) {
        navController.isNavigationBarHidden = hidesNavBar
        navController.navigationItem.hidesBackButton = hidesNavBar
        navController.navigationBar.tintColor = .white

        navController.pushViewController(viewController, animated: true)
    }
}
