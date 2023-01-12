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
    
    private let imageView = UIImageView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private var buttonLogin = UIButton()
    private let stackViewLogin = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        emailTextField.text = "may@hhh.coo"
        passwordTextField.text = "12345678"
        
        configureImage()
        configureStackView()
        configureEmailTextField()
        configurePasswordTextField()
        confgureButton()
      
        
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
    
    @objc func showLogin(){
        guard let presenter = presenter else{ return}
        
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
                let viewController = HomeViewController(dataSource: DevelopersTableViewDataSource(), delegate: DevelopersTableViewDelegate())
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
    
    func configureImage(){
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "what-is-a-web-developer")
        imageView.alpha = 1
        imageView.layer.borderWidth = 10
        imageView.layer.borderColor = .init(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        imageView.layer.cornerRadius = 150.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    func configureEmailTextField() {
        emailTextField.layer.cornerRadius = 10
        emailTextField.placeholder = "Ingrese su correo"
        emailTextField.textColor = .black
        emailTextField.backgroundColor = UIColor(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        emailTextField.leftViewMode = .always
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        stackViewLogin.addArrangedSubview(emailTextField)
    }
    
    func configurePasswordTextField(){
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.placeholder = "Ingrese su contraseña"
        passwordTextField.textColor = .black
        passwordTextField.backgroundColor = UIColor(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        stackViewLogin.addArrangedSubview(passwordTextField)
    }
    func confgureButton(){
        buttonLogin.setTitle(" Iniciar Sesión", for: .normal)
        buttonLogin.setTitleColor(.black, for: .normal)
        buttonLogin.backgroundColor = UIColor(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.8)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.addTarget(self, action: #selector(showLogin), for: .touchDown)
        stackViewLogin.addArrangedSubview(buttonLogin)
        print("vhhv")
    }

    func configureStackView(){
        stackViewLogin.axis = .vertical
        stackViewLogin.spacing = 20
        stackViewLogin.distribution = .fillEqually
        stackViewLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewLogin)
    }
}

