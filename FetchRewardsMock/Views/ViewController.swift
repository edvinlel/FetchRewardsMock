//
//  ViewController.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let categoryViewModel = CategoryViewModel()
    private let mealViewModel = MealViewModel()
    private var selectedCategoryIndex: Int = 0

    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var scrollViewContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.itemSize = CGSize(width: 150, height: 80)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        return collectionView
    }()
    
    private lazy var mealsLabel: UILabel = {
        let label = UILabel()
        label.text = "Meals"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mealCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        let numberOfColumns: CGFloat = 2
        let itemWidth = (view.bounds.width - (numberOfColumns - 1) * layout.minimumInteritemSpacing) / numberOfColumns
        layout.itemSize = CGSize(width: itemWidth - 10, height: itemWidth + 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MealsCollectionViewCell.self, forCellWithReuseIdentifier: MealsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setConstraints()
        
        Task {
            await categoryViewModel.fetchCategories()
            categoryCollectionView.reloadData()
            
            await mealViewModel.fetchMeals(for: .dessert)
            mealCollectionView.reloadData()
        }
    }
    
    private func setConstraints() {
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        scrollView.addSubview(scrollViewContainerView)
        scrollViewContainerView.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            scrollViewContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            scrollViewContainerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            scrollViewContainerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            scrollViewContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            scrollViewContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1)
        ])
        
        scrollViewContainerView.addSubview(categoryCollectionView)
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: scrollViewContainerView.safeAreaLayoutGuide.topAnchor, constant: 40),
            categoryCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainerView.leadingAnchor, constant: 10),
            categoryCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainerView.trailingAnchor, constant: -20),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        scrollViewContainerView.addSubview(mealsLabel)
        NSLayoutConstraint.activate([
            mealsLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 25),
            mealsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            mealsLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            mealsLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        scrollViewContainerView.addSubview(mealCollectionView)
        NSLayoutConstraint.activate([
            mealCollectionView.topAnchor.constraint(equalTo: mealsLabel.bottomAnchor, constant: 20),
            mealCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainerView.leadingAnchor, constant: 10),
            mealCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainerView.trailingAnchor, constant: -10),
            mealCollectionView.bottomAnchor.constraint(equalTo: scrollViewContainerView.bottomAnchor, constant: 0),
            mealCollectionView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categoryViewModel.categories.count
        case mealCollectionView:
            return mealViewModel.allMeals.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            let isSelected = selectedCategoryIndex == indexPath.item
            cell.configure(with: categoryViewModel.categories[indexPath.item], isSelected: isSelected)
            
            return cell
        case mealCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealsCollectionViewCell.identifier, for: indexPath) as! MealsCollectionViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let previousIndex = selectedCategoryIndex
        selectedCategoryIndex = indexPath.item
        collectionView.reloadItems(at: [IndexPath(item: previousIndex, section: 0), indexPath])
        
        let selectedCategory = categoryViewModel.categories[indexPath.item]
    }
}

