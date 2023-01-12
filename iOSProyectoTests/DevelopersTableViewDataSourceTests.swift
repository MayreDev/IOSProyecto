//
//  DevelopersTableViewDataSourceTests.swift
//  iOSProyectoTests
//
//  Created by mobdev on 12-01-23.
//

@testable import iOSProyecto
import XCTest

class DevelopersTableViewDataSourceTests: XCTestCase{
    
    var sut: DevelopersTableViewDataSource!
    
    override func setUp() {
        super.setUp()
        
        sut = DevelopersTableViewDataSource()
        var viewController = HomeViewController(dataSource: sut, delegate: DevelopersTableViewDelegate())
        
        viewController.developerList =
        [[DevelopersModel(image: "person.crop.circle.fill", name: "Mayre Contreras", lenguage: "iOS"),
        DevelopersModel(image: "person.crop.circle.fill", name: "Nicolas Azocar", lenguage: "iOS")],[DevelopersModel(image: "person.crop.circle.fill", name: "Maria Perez", lenguage: "Android"),DevelopersModel(image: "person.crop.circle.fill", name: "Jose Martinez", lenguage: "Android")]]
        
        sut.viewController = viewController
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testsNumberOfSection(){
       // print(sut.tableView(UITableView(), numberOfRowsInSection: 0 ))
        
        XCTAssertEqual(sut.tableView(UITableView(), titleForHeaderInSection: 0), "Programadores iOS")
        XCTAssertEqual(sut.tableView(UITableView(), titleForHeaderInSection: 1), "Programadores Android")
        
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0 ), 2)
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 1 ), 2)
        
        XCTAssertEqual(sut.numberOfSections(in: UITableView()), 2)
    }
    
    func testNumberOfRowszero(){
        sut.viewController = nil
        XCTAssertEqual(sut.numberOfSections(in: UITableView()), 0)
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 1 ), 0)

    }
}
