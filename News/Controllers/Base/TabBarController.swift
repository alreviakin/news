//
//  TabBArController.swift
//  News
//
//  Created by Алексей Ревякин on 06.01.2023.
//

import UIKit

enum tags : Int {
    case news
    case search
    case notification
    case stat
}

class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = Resources.Color.active
        tabBar.barTintColor = Resources.Color.inactive
        
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = Resources.Color.inactive.cgColor
        tabBar.layer.masksToBounds = true
        
        let newsViewController = NewsVC()
        let headlinesViewController = HeadlinesVC()
        let notificationViewController = NotificationVC()
        let statViewController = StatisticVC()
        
        let newsNavController = NavBarController(rootViewController: newsViewController)
        let headlinesNavController = NavBarController(rootViewController: headlinesViewController)
        let notificationNavController = NavBarController(rootViewController: notificationViewController)
        let statNavController = NavBarController(rootViewController: statViewController)

        
        newsNavController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.news,
            image: Resources.Image.TabBar.news,
            tag: tags.news.rawValue)
        headlinesNavController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.search,
            image: Resources.Image.TabBar.search,
            tag: tags.search.rawValue)
        notificationNavController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.notification,
            image: Resources.Image.TabBar.notification,
            tag: tags.notification.rawValue)
        statNavController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.stat,
            image: Resources.Image.TabBar.stat,
            tag: tags.stat.rawValue)
        
        newsNavController.tabBarController?.tabBar.layer.borderWidth = 0
        
        setViewControllers([
            newsNavController,
            headlinesNavController,
            notificationNavController,
            statNavController
        ], animated: false)
    }
    
}
