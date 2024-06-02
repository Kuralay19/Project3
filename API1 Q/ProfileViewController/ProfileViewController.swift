//
//  ProfileViewController.swift
//  API1 Q
//
//  Created by Smart Castle M1A2004 on 14.04.2024.
//
import UIKit
import SnapKit

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    
    let currentUser = "John Doe"
    let userEmail = "john.doe@example.com"
    let likedBooks = ["Book 1", "Book 2", "Book 3"]
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let likedBooksLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layoutUI()
    }
    
    func setupUI() {
        nameLabel.text = "Name: \(currentUser)"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        emailLabel.text = "Email: \(userEmail)"
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        
      
        likedBooksLabel.text = "Liked Books:"
        likedBooksLabel.font = UIFont.systemFont(ofSize: 16)
        likedBooksLabel.numberOfLines = 0
        let likedBooksText = likedBooks.joined(separator: "\n")
        likedBooksLabel.text?.append("\n\(likedBooksText)")
    }
    
    func layoutUI() {
        // Add subviews
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(likedBooksLabel)
        
        // Layout constraints with SnapKit
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(nameLabel)
        }
        
        likedBooksLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(nameLabel)
        }
    }
}

