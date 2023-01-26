//
//  NotificationVC.swift
//  News
//
//  Created by Алексей Ревякин on 04.01.2023.
//

import UIKit

class NotificationVC: Base {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addNavBarItem(with: Resources.Strings.NavBar.notification)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
