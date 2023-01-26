//
//  NavBarController.swift
//  News
//
//  Created by Алексей Ревякин on 09.01.2023.
//


import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        navigationBar.isTranslucent = false
        view.backgroundColor = .white
    }
}
