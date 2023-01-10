//
//  LoginPresenterTests.swift
//  iOSProyectoTests
//
//  Created by mobdev on 09-01-23.
//
@testable import iOSProyecto
import XCTest

class LoginPresenterTests: XCTestCase{
    var sut: LoginPresenter!
    
    override func setUp() {
        super.setUp()
        sut = LoginPresenter()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testIsValidEmailSuccess(){
        XCTAssertTrue(sut.isValidEmail("may@gmail.com"))
    }
    func testIsValidEmailError(){
        XCTAssertFalse(sut.isValidEmail("may@gmail"))
    }
    func testIsValidPasswordSuccess(){
        XCTAssertTrue(sut.isValidPassword("12345678"))
    }
    func testIsValidPasswordError(){
       XCTAssertFalse(sut.isValidPassword("123456"))
    }
}
