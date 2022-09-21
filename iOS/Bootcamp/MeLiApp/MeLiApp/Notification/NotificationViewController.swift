//
//  NotificationViewController.swift
//  MeLiApp
//
//  Created by Lili Cabral on 13/09/22.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        self.title = "Notificações"
        
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = UIColor(.yellow)
        navigationController?.navigationBar.standardAppearance = apparence
        navigationController?.navigationBar.scrollEdgeAppearance = apparence
    }
}
