//
//  MealsCollectionViewCell.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import UIKit

class MealsCollectionViewCell: UICollectionViewCell {
    static let identifier = "\(MealsCollectionViewCell.self)"
    
    private var backgroundContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
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
    
    private func setConstraints() {
        addSubview(backgroundContainer)
        NSLayoutConstraint.activate([
            backgroundContainer.topAnchor.constraint(equalTo: topAnchor),
            backgroundContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupUi() {
        backgroundContainer.layer.cornerRadius = 20
        backgroundContainer.layer.borderWidth = 1
        backgroundContainer.layer.borderColor = UIColor.lightGray.cgColor
    }
}
