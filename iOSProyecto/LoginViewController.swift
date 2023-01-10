//
//  ViewController.swift
//  iOSProyecto
//
//  Created by mobdev on 04-01-23.
//

import UIKit

class LoginViewController: UIViewController {
    
   private var presenter: LoginPresenterProtocol?
    convenience init(presenter: LoginPresenterProtocol) {
        self.init()
        self.presenter = presenter
        presenter.attach(view: self)
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "what-is-a-web-developer")
        image.alpha = 1
        image.layer.borderWidth = 10
        image.layer.borderColor = .init(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        image.layer.cornerRadius = 150.0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.placeholder = "Ingrese su correo"
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.placeholder = " Ingrese su contraseña"
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        var conf = UIButton.Configuration.bordered()
        conf.title = " Iniciar Sesión"
        conf.baseForegroundColor = .black
        conf.attributedTitle?.font = .systemFont(ofSize: 18, weight: .bold)
        conf.baseBackgroundColor = UIColor(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.8)
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.showLogin()
        }))
        button.configuration = conf
        return button
    }()
    
    let stackViewLogin: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        emailTextField.text = "may@hhh.coo"
        passwordTextField.text = "12345678"
        
        view.backgroundColor = .white
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        view.addSubview(stackViewLogin)
        stackViewLogin.addArrangedSubview(emailTextField)
        stackViewLogin.addArrangedSubview(passwordTextField)
        stackViewLogin.addArrangedSubview(loginButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            stackViewLogin.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            stackViewLogin.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackViewLogin.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    func showLogin(){
        guard let presenter = presenter else{ return
        }
        guard let emailText = emailTextField.text, !emailText.isEmpty else {
            presentAlert(title: "Error", message: "El campo del correo no deben estar vacios")
            return
        }
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else {
            presentAlert(title: "Error", message: "El campo del contraseña no deben estar vacios")
            return
        }
        
        let isValidEmail = presenter.isValidEmail(emailText)
        
        let isValidPassword = presenter.isValidPassword(passwordText)
                
            
            if isValidEmail && isValidPassword{
                let viewController = HomeViewController()
                viewController.modalPresentationStyle = .fullScreen
               // present(viewController, animated: true)
                navigationController?.pushViewController(viewController, animated: true)
            }else{
            presentAlert(title: "Error", message: "Los datos ingresados no son correctos")
        }
        }
    
    
    func presentAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        present(alert, animated: true)
    }

}

