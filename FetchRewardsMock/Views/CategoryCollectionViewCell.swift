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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setConstraints() {
        addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with category: String) {
        categoryLabel.text = category
    }
}
