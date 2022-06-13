//
//  QuickLookViewController.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class QuickLookViewController: UIViewController {
    // MARK: Properties
    private let quickLookView = QuickLookView()
    weak var coordinator: QuickLookable?

    // MARK: View Lifecycle
    override func loadView() {
        view = quickLookView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
