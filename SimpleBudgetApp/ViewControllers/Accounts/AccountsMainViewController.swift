//
//  AccountsMainViewController.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class AccountsMainViewController: UIViewController {
    private let accountsMainView = AccountsMainView()
    weak var coordinator: Accountable?

    override func loadView() {
        view = accountsMainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
