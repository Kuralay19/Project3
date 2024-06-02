//
//  DiscoverViewController.swift
//  API1 Q
//
//  Created by Smart Castle M1A2004 on 14.04.2024.
//
import UIKit
import SnapKit

class DiscoverViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let progressLabel = UILabel()
    let progressBar = UIProgressView()
    let readPercentage: Float = 0.75 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layoutUI()
        updateProgress()
    }
    
    func setupUI() {
        // Configure progress label
        progressLabel.text = "Reading Progress:"
        progressLabel.textAlignment = .center
        
        // Configure progress bar
        progressBar.setProgress(readPercentage, animated: true)
        progressBar.tintColor = .blue
    }
    
    func layoutUI() {
        // Add subviews
        view.addSubview(progressLabel)
        view.addSubview(progressBar)
        
        // Layout constraints with SnapKit
        progressLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        progressBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(progressLabel.snp.bottom).offset(20)
        }
    }
    
    func updateProgress() {
        progressLabel.text = String(format: "Reading Progress: %.0f%%", readPercentage * 100)
    }
}
