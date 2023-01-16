//
//  DevelopersTableViewDelegate.swift
//  iOSProyecto
//
//  Created by mobdev on 10-01-23.
//

import UIKit

class DevelopersTableViewDelegate: NSObject {
    
    var viewController: HomeViewControllerProtocol?
    
    }

extension DevelopersTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("la celda \(indexPath.row) fue seleccionada")
        
        viewController?.goToDetail(indexPath: indexPath)
    }
}

