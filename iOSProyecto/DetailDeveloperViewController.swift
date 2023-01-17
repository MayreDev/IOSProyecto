//
//  DetailDeveloperViewController.swift
//  iOSProyecto
//
//  Created by mobdev on 04-01-23.
//

import UIKit
import Kingfisher
import Lottie

class DetailDeveloperViewController: UIViewController {
 
    var developerDetail: DevelopersModel?
    
    private let imagePerson: UIImageView = {
        let image = UIImageView()
        
        image.alpha = 1
        image.layer.borderWidth = 10
        image.layer.borderColor = .init(red: 148.0/255.0, green: 188.0/255.0, blue: 239.0/255.0, alpha: 0.5)
        image.layer.cornerRadius = 150.0
        image.clipsToBounds = true
        
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints =  false
        return image
    }()

    private let namelabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.numberOfLines = 0
        return label
    }()
    
    private let lenguageProgramerlabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    let  animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(imagePerson)
        view.addSubview(namelabel)
        view.addSubview(lenguageProgramerlabel)
       
        animation()
        
        NSLayoutConstraint.activate([
            imagePerson.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            imagePerson.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePerson.widthAnchor.constraint(equalToConstant: 300),
            imagePerson.heightAnchor.constraint(equalToConstant: 300),
            
            namelabel.topAnchor.constraint(equalTo: imagePerson.bottomAnchor, constant: 10),
            namelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            lenguageProgramerlabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 10),
            lenguageProgramerlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            lenguageProgramerlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            animationView.topAnchor.constraint(equalTo: lenguageProgramerlabel.bottomAnchor, constant: 10),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200),
           
        ])
        setupView()
    }
    
    func setupView() {
       // imagePerson.image = UIImage(systemName: developerDetail?.image ?? "")
        //imagePerson.layer.cornerRadius = 50

        imagePerson.kf.setImage(with: developerDetail?.image)
        namelabel.text = developerDetail?.name
        lenguageProgramerlabel.text = "Proceso acelerador, equipo de \(developerDetail?.lenguage ?? "")"
        if developerDetail?.developerType == .ios{
            animationView.animation = LottieAnimation.named("17004-apple-logo-animation")
            animationView.loopMode = .loop
            animationView.play()
        }else{
            animationView.animation = LottieAnimation.named("37135-android-logo")
            animationView.loopMode = .loop
            animationView.play()
        }
    }
    
    

    func animation(){
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
    }
    
}


