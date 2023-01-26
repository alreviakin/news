//
//  Base.swift
//  News
//
//  Created by Алексей Ревякин on 06.01.2023.
//

import UIKit

class Base: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension Base {
    func addNavBarItem(with title: String) {
        let buttonRight = UIButton()
        let imageView = UIImageView(image: Resources.Image.NavBar.dots)
        buttonRight.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-21)
        }
        let buttonLeft = UIButton()
        buttonLeft.setTitle(title, for: .normal)
        buttonLeft.setTitleColor(.black, for: .normal)
        buttonLeft.titleLabel?.font = Resources.Font.helvetica
        buttonLeft.titleLabel?.snp.makeConstraints({ make in
            make.left.equalToSuperview().offset(10)
        })
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
        buttonRight.addTarget(self, action: #selector(touchRight(sender:)), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(touchLeft(sender:)), for: .touchUpInside)
    }
}

@objc extension Base {
    func touchRight(sender: UIButton) {
        print("right")
    }
    
    func touchLeft(sender: UIButton) {
        print("left")
    }
}
