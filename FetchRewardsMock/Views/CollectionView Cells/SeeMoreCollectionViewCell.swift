//
//  SeeMoreCollectionViewCell.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import UIKit

class SeeMoreCollectionViewCell: UICollectionViewCell {
    static let identifier = "\(SeeMoreCollectionViewCell.self)"
    
    private var backgroundContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .right
        label.textColor = .black
        label.text = "See More"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(backgroundContainer)
        NSLayoutConstraint.activate([
            backgroundContainer.topAnchor.constraint(equalTo: topAnchor),
            backgroundContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        backgroundContainer.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: backgroundContainer.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backgroundContainer.centerYAnchor)
            
        ])
    }
    
    private func setupUi() {
        backgroundContainer.layer.cornerRadius = 20
        backgroundContainer.layer.borderWidth = 1
        backgroundContainer.layer.borderColor = UIColor.lightGray.cgColor
    }
}
