//
//  Detail view controller .swift
//  API1 Q
//
//  Created by Smart Castle M1A2004 on 22.10.2023.
//

import UIKit
class DetailViewController: UIViewController {
    var result: Results
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "57 seconds"
        label.textColor = .yellow
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    } ()
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "posterDemo")?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var descriptonLabel: UILabel = {
        let label = UILabel()
        label.text = " Highly reccomendeed to watch"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.backward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
//    lazy var favoriteButton: UIButton = {
//
//    }()
    
        init(result: Results) {
            self.result = result
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = result.title
        descriptonLabel.text = result.overview
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        backButton.addTarget(self, action: #selector(handleBackPressed), for: .touchUpInside)
        
        view.backgroundColor = .black
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -20).isActive = true
        
        view.addSubview(posterImageView)
        posterImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        posterImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 20).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(descriptonLabel)
        descriptonLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor,constant: 40).isActive = true
        descriptonLabel.leftAnchor.constraint(equalTo: posterImageView.leftAnchor,constant: 20).isActive = true
        descriptonLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -20).isActive = true
    }
    @objc func handleBackPressed(button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func handleFavPressed(button: UIButton) {
        button.isSelected.toggle()
    }
   
}


