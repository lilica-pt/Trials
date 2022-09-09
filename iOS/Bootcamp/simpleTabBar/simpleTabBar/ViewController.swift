//
//  ViewController.swift
//  simpleTabBar
//
//  Created by Lili Cabral on 09/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = { // 1
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52)) // 2
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button) // 3
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) // 4
    }

    override func viewDidLayoutSubviews() { // 5
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton() { // 6
        let tabBarVC = UITabBarController() // 7
        
        let vc1 = UINavigationController(rootViewController: FirstViewController()) // 12
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        
        vc1.title = "Home"
        vc2.title = "Contact"
        vc3.title = "Help"
        vc4.title = "Settings"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false) // 8
        
        guard let items = tabBarVC.tabBar.items else { return } // 13
        let images = ["house", "bell", "person.circle", "gear"]
        for x in 0..<items.count { // 14
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen // 9
        present(tabBarVC, animated: true) // 10

    }
}

class FirstViewController: UIViewController { // 11
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange // 8
        title = "Home"
        
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

// 1 ao invés de login, o botão leva a TabBar
// 2 customizando o botão
// 3 adiciona ele como uma subview
// 4 adicionando uma atribuição ao botão, o #selector é uma notação de objc, por isso a função precisará referenciá-lo
// 5 para centralizar o botão em relação a view
// 6 notação em objc
// 7 a função cria a apresenta uma TabBar controller
// 8 indica qual será a vc base, pois cada tab é vinculada à uma vc que é responsável pela própria estrutura, ou seja, cada botão referenciará uma tela autônoma em sua exibição e configurações. O conjunto de vc foi criado aqui através de um array
// 9 formato que o modal será exibido na tela = .fullScreen
// 10 exibir a Tab
// 11 criando 3 vc para exemplo
// 12 colocando vc dentro de nc, que contêiner e gerencia mais de uma vc
// 13 obter o itens da TabBar para circular (loop) entre eles
// 14 guard let é opcional, então o for acessa (unwrap) eles usando um intervalo aberto
