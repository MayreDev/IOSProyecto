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
        [[DevelopersModel(image: URL(string: "https://img.europapress.es/fotoweb/fotonoticia_20160617143538_420.jpg")!, name: "Mayre Contreras", lenguage: "iOS", developerType: .ios),
          DevelopersModel(image: URL(string: "https://img.europapress.es/fotoweb/fotonoticia_20160617143538_420.jpg")!, name: "Nicolas Azocar", lenguage: "iOS", developerType: .ios)],[DevelopersModel(image: URL(string: "https://img.europapress.es/fotoweb/fotonoticia_20160617143538_420.jpg")!, name: "Maria Perez", lenguage: "Android", developerType: .android),DevelopersModel(image: URL(string: "https://img.europapress.es/fotoweb/fotonoticia_20160617143538_420.jpg")!, name: "Jose Martinez", lenguage: "Android", developerType: .android)]]
        
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
