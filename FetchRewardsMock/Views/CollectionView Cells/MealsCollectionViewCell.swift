//
//  MealsCollectionViewCell.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import UIKit

class MealsCollectionViewCell: UICollectionViewCell {
    static let identifier = "\(MealsCollectionViewCell.self)"
    private let imageLoader = ImageLoader()
    
    private var backgroundContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    private var mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = false
        
        return imageView
    }()
    
    private var transluscentCoverView: UIView = {
        let view = UIView()
        view.layer.opacity = 0.2
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        
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
        
        backgroundContainer.addSubview(mealImageView)
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: backgroundContainer.topAnchor),
            mealImageView.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor),
            mealImageView.bottomAnchor.constraint(equalTo: backgroundContainer.bottomAnchor)
        ])
        
        backgroundContainer.addSubview(transluscentCoverView)
        NSLayoutConstraint.activate([
            transluscentCoverView.topAnchor.constraint(equalTo: mealImageView.topAnchor),
            transluscentCoverView.leadingAnchor.constraint(equalTo: mealImageView.leadingAnchor),
            transluscentCoverView.trailingAnchor.constraint(equalTo: mealImageView.trailingAnchor),
            transluscentCoverView.bottomAnchor.constraint(equalTo: mealImageView.bottomAnchor)
        ])
        
        backgroundContainer.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: backgroundContainer.bottomAnchor, constant: -15)
            
        ])
    }
    
    private func setupUi() {
        backgroundContainer.layer.cornerRadius = 20
        backgroundContainer.layer.borderWidth = 1
        backgroundContainer.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(with meal: Meal) {
        titleLabel.text = meal.strMeal
        
        guard let url = URL(string: meal.strMealThumb) else { return }
        imageLoader.loadImage(from: url) { image in
            self.mealImageView.image = image
        }
    }
}
