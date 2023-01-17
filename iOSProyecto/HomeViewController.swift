//
//  HomeViewController.swift
//  iOSProyecto
//
//  Created by mobdev on 04-01-23.
//

import UIKit
import Kingfisher

struct DevelopersModel {
    let image: URL
    let name: String
    let lenguage: String
    let developerType:  DeveloperType
}

enum DeveloperType{
    case ios
    case android
    
}

class HomeViewController: UIViewController, HomeViewControllerProtocol{
    
    private let dataSource: DevelopersTableViewDataSource?
    private let delegate: DevelopersTableViewDelegate?
    
    init(dataSource: DevelopersTableViewDataSource, delegate: DevelopersTableViewDelegate?) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.dataSource?.viewController = self
        self.delegate?.viewController = self
       // self.delegate?.detailDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let listDevelopers = [
        DevelopersModel(image: URL(string: "https://e7.pngegg.com/pngimages/976/946/png-clipart-woman-programmer-girl-love-woman.png")!, name: "Mayre Contreras", lenguage: "iOS", developerType: .ios),
        DevelopersModel(image: URL(string: "https://img.freepik.com/vector-gratis/ilustracion-concepto-programacion_114360-1351.jpg?w=2000")!, name: "Nicolas Azocar", lenguage: "iOS", developerType: .ios),
    ]

    private let listandroid = [
        DevelopersModel(image: URL(string: "https://thumbs.dreamstime.com/z/promotor-de-web-programador-flat-vector-illustration-codificador-joven-freelancer-en-personaje-dibujos-animados-los-auriculares-146832093.jpg")!, name: "Jose Perez", lenguage: "Android", developerType: .android),
        DevelopersModel(image: URL(string: "https://w7.pngwing.com/pngs/651/205/png-transparent-user-the-cartoon-guide-to-computer-science-computer-computer-public-relations-business.png")!, name: "Maria Martinez", lenguage: "Android", developerType: .android),
    ]

    var developerList = [[]]
    
    private let developerTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Equipo Acelerador 3ra Generación"
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        developerList = [listDevelopers, listandroid]
        developerTableView.backgroundColor = .white
        
        view.addSubview(developerTableView)
        developerTableView.dataSource = dataSource
        developerTableView.delegate = delegate
        developerTableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
        NSLayoutConstraint.activate([
            developerTableView.topAnchor.constraint(equalTo: view.topAnchor),
            developerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            developerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            developerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func goToDetail(indexPath: IndexPath) {
        let developer = developerList[indexPath.section][indexPath.row]
        let presenterViewController = DetailDeveloperViewController()
        presenterViewController.developerDetail = developer as? DevelopersModel
        navigationController?.pushViewController(presenterViewController, animated: true)
    }
}
