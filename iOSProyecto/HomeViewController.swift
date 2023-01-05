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
}

let listDevelopers = [
DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras"),
DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras"),
DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras"),
DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras"),
DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras"),

]

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    
    private let developerTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        developerTableView.backgroundColor = .white
        developerTableView.dataSource = self
        developerTableView.delegate = self
        developerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(developerTableView)
        
        NSLayoutConstraint.activate([
            developerTableView.topAnchor.constraint(equalTo: view.topAnchor),
            developerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            developerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            developerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listDevelopers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let model = listDevelopers[indexPath.row]
        
        var setupList = UIListContentConfiguration.cell()
        setupList.text = model.name
        setupList.image =  UIImage(systemName: model.image)
        cell.contentConfiguration = setupList

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("la celda \(indexPath.row) fue seleccionada")
        let viewController = DetailDeveloperViewController()
        
        present(viewController, animated: true)
    }
}
