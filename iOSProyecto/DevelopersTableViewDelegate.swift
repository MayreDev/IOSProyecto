//
//  DevelopersTableViewDelegate.swift
//  iOSProyecto
//
//  Created by mobdev on 10-01-23.
//

import UIKit

class DevelopersTableViewDelegate: NSObject {
    
    weak var viewController: HomeViewController?
    
    var detailDelegate: NavigationDetailInfoProtocol?
}

extension DevelopersTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("la celda \(indexPath.row) fue seleccionada")
        detailDelegate?.goToDetail(indexPath: indexPath)
    }
}

protocol NavigationDetailInfoProtocol{
    func goToDetail(indexPath: IndexPath)
}
