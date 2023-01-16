//
//  NavigationDetailMock.swift
//  iOSProyectoTests
//
//  Created by mobdev on 12-01-23.
//
@testable import iOSProyecto
import UIKit

class NavigationDetailMock: HomeViewControllerProtocol{
    
    var success = false
    
    func goToDetail(indexPath: IndexPath) {
        
        success = true
    }
    
    
}
