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

let listDevelopers = [
    DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras", lenguage: "iOS"),
    DevelopersModel(image: "person.crop.circle.fill", name: "Nicolas Azocar", lenguage: "iOS"),
]

let listandroid = [
    DevelopersModel(image: "person.crop.circle.fill", name: "Maria Perez", lenguage: "Android"),
    DevelopersModel(image: "person.crop.circle.fill", name: "Jose Martinez", lenguage: "Android"),
]

let developerList = [listDevelopers, listandroid]

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
        
    private let developerTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Equipo Acelerador 3ra Generación"

      
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        developerTableView.backgroundColor = .white
        developerTableView.dataSource = self
        developerTableView.delegate = self
        developerTableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        view.addSubview(developerTableView)
        
        NSLayoutConstraint.activate([
            developerTableView.topAnchor.constraint(equalTo: view.topAnchor),
            developerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            developerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            developerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        developerList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developerList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let developer = developerList[indexPath.section][indexPath.row]
        
        cell.configure(model: developer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Programadores iOS"
        }
        else {
            return "Programadores Frontend"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("la celda \(indexPath.row) fue seleccionada")
        let viewController = DetailDeveloperViewController()
        viewController.modalPresentationStyle = .fullScreen
        let developer = developerList[indexPath.section][indexPath.row]
        viewController.developerDetail = developer
        navigationController?.pushViewController(viewController, animated: true)
    }

}
