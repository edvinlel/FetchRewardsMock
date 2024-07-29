//
//  CategoryCollectionViewCell.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "\(CategoryCollectionViewCell.self)"
    
    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private var backgroundContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        backgroundContainer.layer.cornerRadius = 20
        backgroundContainer.layer.borderWidth = 1
        backgroundContainer.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setConstraints() {
        addSubview(backgroundContainer)
        NSLayoutConstraint.activate([
            backgroundContainer.topAnchor.constraint(equalTo: topAnchor),
            backgroundContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        backgroundContainer.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with category: String, isSelected: Bool) {
        categoryLabel.text = category
        
        backgroundContainer.backgroundColor = isSelected ? .black : .white
        categoryLabel.textColor = isSelected ? .white : .black
    }
}
