//
//  DetailDeveloperViewController.swift
//  iOSProyecto
//
//  Created by mobdev on 04-01-23.
//

import UIKit

class DetailDeveloperViewController: UIViewController {
 
    var developerDetail: DevelopersModel?
    
    private let imagePerson: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints =  false
        return image
    }()

    private let namelabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    private let lenguageProgramerlabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imagePerson)
        view.addSubview(namelabel)
        view.addSubview(lenguageProgramerlabel)
        
        NSLayoutConstraint.activate([
            imagePerson.heightAnchor.constraint(equalToConstant: 200),
            imagePerson.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            imagePerson.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            imagePerson.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            namelabel.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 10),
            namelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            lenguageProgramerlabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 10),
            lenguageProgramerlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            lenguageProgramerlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
           
        ])
        setupView()
    }
    
    func setupView() {
        imagePerson.image = UIImage(systemName: developerDetail?.image ?? "")
        namelabel.text = developerDetail?.name
        lenguageProgramerlabel.text = "Proceso acelerador, equipo de \(developerDetail?.lenguage ?? "")"
    }
}


