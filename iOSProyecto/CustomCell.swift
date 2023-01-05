//
//  CustomCell.swift
//  iOSProyecto
//
//  Created by mobdev on 04-01-23.
//

import UIKit



class CustomCell: UITableViewCell {
    
    
    private let imagePerson: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints =  false
        return image
    }()

    private let namelabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    private let lenguageProgramerlabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(imagePerson)
        addSubview(namelabel)
        addSubview(lenguageProgramerlabel)
        
        NSLayoutConstraint.activate([
            imagePerson.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imagePerson.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imagePerson.widthAnchor.constraint(equalToConstant: 100),
            
            namelabel.leadingAnchor.constraint(equalTo: imagePerson.trailingAnchor, constant: 20),
            namelabel.centerYAnchor.constraint(equalTo: imagePerson.centerYAnchor),
            
            lenguageProgramerlabel.leadingAnchor.constraint(equalTo: imagePerson.trailingAnchor, constant: 20),
            lenguageProgramerlabel.centerYAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 10),
            lenguageProgramerlabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: DevelopersModel){
        
        imagePerson.image = UIImage(systemName: model.image)
        namelabel.text = model.name
        lenguageProgramerlabel.text = model.lenguage
        
    }
}
