//
//  DevelopersTableView.swift
//  iOSProyecto
//
//  Created by mobdev on 10-01-23.
//

import UIKit

class DevelopersTableViewDataSource: NSObject{
    
    weak var viewController: HomeViewController?
}

extension DevelopersTableViewDataSource: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewController?.developerList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewController?.developerList[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewController = viewController else { return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let developer = viewController.developerList[indexPath.section][indexPath.row]
        cell.configure(model: developer as! DevelopersModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Programadores iOS"
        }
        else {
            return "Programadores Android"
        }
    }
}
