//
//  ViewController.swift
//  iOSProyecto
//
//  Created by mobdev on 04-01-23.
//

import UIKit

class LoginViewController: UIViewController {
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
    
    let emailLabel: UILabel = {
       let label = UILabel()
        label.text = "Correo"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
      return label
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.placeholder = "Ingrese su correo"
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        return textField
    }()
    let passwordlLabel: UILabel = {
       let label = UILabel()
        label.text = "Contraseña"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
      return label
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
        stackViewLogin.addArrangedSubview(emailLabel)
        stackViewLogin.addArrangedSubview(emailTextField)
        stackViewLogin.addArrangedSubview(passwordlLabel)
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
        if !emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty{
            if isValidEmail(emailTextField.text!) && isValidPassword(passwordTextField.text!){
                let viewController = HomeViewController()
                viewController.modalPresentationStyle = .fullScreen
                present(viewController, animated: true)
               // navigationController?.pushViewController(viewController, animated: true)
            }
        }else{
            let alert = UIAlertController(title: "Error", message: "El campo del correo y contraseña no deben estar vacios", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            present(alert, animated: true)
        }
     
    }
    
    func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

            if !emailPred.evaluate(with: email){
                let alert = UIAlertController(title: "Error", message: "Formato de correo invalido", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default))
                present(alert, animated: true)
            }
            return emailPred.evaluate(with: email)
        }
    
    func isValidPassword(_ password: String) -> Bool{
            var validpassword = false
            if password.count >= 8{
                validpassword = true
            }else{
                let alert = UIAlertController(title: "Error", message: "La contraseña necesita al menos 8 caracteres", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default))
                present(alert, animated: true)
            }
            return validpassword
        }

}

