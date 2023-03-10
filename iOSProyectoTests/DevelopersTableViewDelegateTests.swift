//
//  DevelopersTableViewDelegateTests.swift
//  iOSProyectoTests
//
//  Created by mobdev on 12-01-23.
//

@testable import iOSProyecto
import XCTest

class DevelopersTableViewDelegateTests: XCTestCase {
    
    var sut: DevelopersTableViewDelegate!
    var mock: NavigationDetailMock!
    
    override func setUp() {
        super.setUp()
        
        sut = DevelopersTableViewDelegate()
        mock = NavigationDetailMock()
        sut.viewController = mock
        
       // navigation = HomeViewController(dataSource: DevelopersTableViewDataSource, delegate: sut)
        
       // navigation.goToDetail(indexPath: navigation)
      
    }
    
    
    override class func tearDown() {
        
        super.tearDown()
    }
    

    
    func testdidSelection() {
        
        XCTAssertFalse(mock.success)
        
        sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0) )
        
        XCTAssertTrue(mock.success)
    }
    
}


