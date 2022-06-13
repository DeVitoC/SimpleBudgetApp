//
//  MainTabBarController.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

/// The main **UITabBarController** that the user is directed to after succesfully logging in or creating an account.
final class MainTabBarController: UITabBarController {
    private var customTabBar: MainTabBar!
    private let tabBarHeight: CGFloat
    weak var coordinator: MainCoordinatable?
    private let hasPhysicalButton: Bool
    let tabItems: [TabItem] = [.accounts, .income, .budget, .monthAtAGlance]

    init(coordinator: MainCoordinatable, hasPhysicalButton: Bool) {
        self.coordinator = coordinator
        tabBarHeight = hasPhysicalButton ? 55 : 70
        self.hasPhysicalButton = hasPhysicalButton
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder: NSCoder) {fatalError()}

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
        setupCoordinators()
        tabBar.heightAnchor.constraint(equalToConstant: tabBarHeight).isActive = true
    }

    // MARK: Public methods
    func changeTabs(to tab: Int) {
        customTabBar.switchTab(from: selectedIndex, to: tab)
    }

    func hideTabBar() {
        guard let navVCCount = navigationController?.viewControllers.count else { return }
        if navVCCount > 1 {
            customTabBar.isHidden = true
        } else {
            customTabBar.isHidden = false
        }
    }

    // MARK: Private methods
    private func setupCoordinators() {
        viewControllers = [UINavigationController()]
        coordinator?.createTabBarCoordinators(completion: { [weak self] viewControllers in
//            self?.viewControllers = viewControllers
            self?.viewControllers?.append(contentsOf: viewControllers)
        })
    }

    private func loadTabBar() {
        self.setupCustomTabMenu(tabItems)

        selectedIndex = 0
    }

    private func setupCustomTabMenu(_ menuItems: [TabItem]) {
        let frame = tabBar.frame

        tabBar.isHidden = true

        customTabBar = MainTabBar(menuItems: menuItems, frame: frame, hasPhysicalButton: hasPhysicalButton)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.clipsToBounds = true
        customTabBar.itemTapped = self.changeTab

        view.addSubview(customTabBar)

        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight),
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])

        view.layoutIfNeeded()
    }

    private func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
}

extension MainTabBarController {
    /// Enum describing the Tab Bar Items, their associated **UIViewControllers** and their associated **UIImages**
    enum TabItem: String, CaseIterable {
        case accounts
        case income
        case budget
        case monthAtAGlance = "Quick Look"

        var icon: UIImage {
            switch self {
                case .accounts:
                    return UIImage(systemName: "chart.pie")!
                case .income:
                    return UIImage(systemName: "plus.app")!
                case .budget:
                    return UIImage(systemName: "chart.bar")!
                case .monthAtAGlance:
                    return UIImage(systemName: "magnifyingglass.circle")!
            }
        }

        var displayTitle: String {
            return self.rawValue.capitalized
        }
    }
}
