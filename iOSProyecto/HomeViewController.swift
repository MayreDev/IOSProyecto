//
//  HomeViewController.swift
//  iOSProyecto
//
//  Created by mobdev on 04-01-23.
//

import UIKit

struct DevelopersModel {
    let image: String
    let name: String
    let lenguage: String
}

class HomeViewController: UIViewController, NavigationDetailInfoProtocol{
    
    private let dataSource: DevelopersTableViewDataSource?
    private let delegate: DevelopersTableViewDelegate?
    
    init(dataSource: DevelopersTableViewDataSource, delegate: DevelopersTableViewDelegate?) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.dataSource?.viewController = self
        self.delegate?.viewController = self
        self.delegate?.detailDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let listDevelopers = [
        DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras", lenguage: "iOS"),
        DevelopersModel(image: "person.crop.circle.fill", name: "Nicolas Azocar", lenguage: "iOS"),
    ]

    private let listandroid = [
        DevelopersModel(image: "person.crop.circle.fill", name: "Maria Perez", lenguage: "Android"),
        DevelopersModel(image: "person.crop.circle.fill", name: "Jose Martinez", lenguage: "Android"),
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
