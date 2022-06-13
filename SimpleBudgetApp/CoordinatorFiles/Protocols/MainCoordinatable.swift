//
//  MainCoordinatable.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 5/29/22.
//

import UIKit

protocol MainCoordinatable: AnyObject {
    func createTabBarCoordinators(completion: @escaping ([UIViewController]) -> Void)
}
