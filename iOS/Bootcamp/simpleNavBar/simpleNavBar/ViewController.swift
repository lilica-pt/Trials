//
//  ViewController.swift
//  simpleNavBar
//
//  Created by Lili Cabral on 14/09/22.
//

import UIKit

class ViewController: UIViewController { // 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bar Items"
        view.backgroundColor = .systemPink
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemYellow
        button.setTitle("Vá para View 2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) // 2
        
        navigationController?.navigationBar.tintColor = .label // 3
        
        configureItems()
    }
    
    private func configureItems() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "person.circle"), // 4
                style: .done,
                target: self,
                action: nil
            )]
            
            let customView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40)) // 5
            customView.text = "Hello"
            customView.textAlignment = .center
            customView.backgroundColor = .orange
            customView.layer.cornerRadius = 8
            customView.layer.masksToBounds = true
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                customView: customView
            )
    }
    
    @objc func didTapButton() {
        let viewController = UIViewController()
        viewController.title = "View 2"
        viewController.view.backgroundColor = .systemBlue
        
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out",
                                                                           style: .done,
                                                                           target: self,
                                                                           action: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// 1 essa viewController já está inserida à NC, após selecionar o storyboard > editor > embeb in > navigation controller
// 2 referencia à própria vc
// 3 ficará preto ou branco conforme as configurações do usuário, mas pode ser outra cor
// 4 customizando a imagem
// 5 customização do botão, incluindo texto
