//
//  LoginPresenter.swift
//  iOSProyecto
//
//  Created by mobdev on 06-01-23.
//

import UIKit

final class LoginPresenter: LoginPresenterProtocol {
    
    private weak var view: LoginViewController?
    
    func attach(view: LoginViewController){
        self.view = view
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool{
        var validpassword = false
        if password.count >= 8{
            validpassword = true
        }
        return validpassword
    }
    
    
}
protocol LoginPresenterProtocol {
    func isValidEmail(_ email: String) -> Bool
    func isValidPassword(_ password: String) -> Bool
    func attach(view: LoginViewController)
}
