//
//  MainTabBar.swift
//  SimpleBudgetApp
//
//  Created by Christopher Devito on 6/12/22.
//

import UIKit

class MainTabBar: UITabBar {
    var itemTapped: ((_ tab: Int) -> Void)?
    private var activeItem: Int = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(menuItems: [MainTabBarController.TabItem], frame: CGRect, hasPhysicalButton: Bool) {
        self.init(frame: frame)
        layer.backgroundColor = UIColor.systemBackground.cgColor

        for menuItem in 0..<menuItems.count {
            let itemWidth = (frame.width / CGFloat(menuItems.count))
            let leadingAnchor = (itemWidth * CGFloat(menuItem))

            let itemView = createTabItem(item: menuItems[menuItem])
            itemView.tag = menuItem + 1
            print(itemView.tag)

            addSubview(itemView)

            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: heightAnchor),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor + itemWidth),
                itemView.topAnchor.constraint(equalTo: topAnchor),
            ])

        }
        print(subviews)
        setNeedsLayout()
        layoutIfNeeded()
        activateTab(tab: activeItem)
    }

    @available(*, unavailable) required init?(coder: NSCoder) {fatalError()}

    private func createTabItem(item: MainTabBarController.TabItem) -> UIView {
        let tabBarItem = UIView(frame: .zero)
        let itemTitleLabel = UILabel(frame: .zero)
        let itemIconView = UIImageView(frame: .zero)

        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.textColor = .lightGray
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.font = itemTitleLabel.font.withSize(10)
        itemIconView.image = item.icon.withRenderingMode(.automatic).withTintColor(.lightGray)
        itemIconView.tintColor = .lightGray
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true

        tabBarItem.layer.backgroundColor = UIColor.systemBackground.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true

        NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 15),
            itemIconView.widthAnchor.constraint(equalToConstant: 15),
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 8),
            itemTitleLabel.heightAnchor.constraint(equalToConstant: 12),
            itemTitleLabel.centerXAnchor.constraint(equalTo: itemIconView.centerXAnchor),
            itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor),
            itemTitleLabel.topAnchor.constraint(equalTo: itemIconView.bottomAnchor, constant: 4)
        ])

        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))

        return tabBarItem
    }

    @objc private func handleTap(_ sender: UIGestureRecognizer) {
        switchTab(from: activeItem, to: sender.view!.tag)
    }

    func switchTab(from: Int, to: Int) {
        deactivateTab(tab: from)
        activateTab(tab: to)
    }

    private func activateTab(tab: Int) {
        let tabToActivate = subviews[tab]
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.backgroundColor = .lightGray.withAlphaComponent(0.05)
                for subview in tabToActivate.subviews {
                    if let image = subview as? UIImageView {
                        switch tabToActivate.tag {
                            case 1:
                                image.image = UIImage(systemName: "chart.pie.fill")!.withTintColor(.white)
                            case 2:
                                image.image = UIImage(systemName: "plus.app.fill")!.withTintColor(.white)
                            case 3:
                                image.image = UIImage(systemName: "chart.bar.fill")!.withTintColor(.white)
                            case 4:
                                image.image = UIImage(systemName: "magnifyingglass.circle.fill")!.withTintColor(.white)
                            default:
                                image.image = image.image?.withTintColor(.white)
                        }
                    } else if let text = subview as? UILabel {
                        text.textColor = .black
                    }
                }
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        activeItem = tab
    }

    private func deactivateTab(tab: Int) {
        print(subviews)
        let inactiveTab = subviews[tab]

        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1,
                           delay: 0.0,
                           options: [.curveEaseIn, .allowUserInteraction], animations: {
                inactiveTab.backgroundColor = .systemBackground
                for subview in inactiveTab.subviews {
                    if let image = subview as? UIImageView {
                        switch inactiveTab.tag {
                            case 1:
                                image.image = UIImage(systemName: "chart.pie")!.withTintColor(.lightGray)
                            case 2:
                                image.image = UIImage(systemName: "plus.app")!.withTintColor(.lightGray)
                            case 3:
                                image.image = UIImage(systemName: "chart.bar")!.withTintColor(.lightGray)
                            case 4:
                                image.image = UIImage(systemName: "magnifyingglass.circle")!.withTintColor(.lightGray)
                            default:
                                image.image = image.image?.withTintColor(.lightGray)
                        }
                    } else if let text = subview as? UILabel {
                        text.textColor = .lightGray
                    }
                }
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
}
