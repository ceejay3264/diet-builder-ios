//
//  RecipeNutrientsTableViewCell.swift
//  MealMatch
//
//  Created by Christopher Cordero on 5/14/24.
//

import UIKit

class RecipeNutrientsTableViewCell: UITableViewCell {
    
    static let identifier = "RecipeNutrientsTableViewCell"
    
    private var titleLabel: UILabel = {
        var view = UILabel()
        view.tintColor = .darkText
        view.font = .systemFont(ofSize: 20.0, weight: .bold)
        return view
    }()
    
    private var caloriesLabel: UILabel = {
        var view = UILabel()
        view.tintColor = .darkText
        view.font = .systemFont(ofSize: 17.0, weight: .medium)
        return view
    }()
    
    private var proteinLabel: UILabel = {
        var view = UILabel()
        view.tintColor = .darkText
        view.font = .systemFont(ofSize: 17.0, weight: .medium)
        return view
    }()
    
    public var recipeTitle = "" {
        didSet {
            titleLabel.text = recipeTitle
        }
    }
    
    public var calorieCount = 0 {
        didSet {
            caloriesLabel.text = "\(String(calorieCount)) calories"
        }
    }
    
    public var proteinCount = "" {
        didSet {
            proteinLabel.text = "\(String(proteinCount)) of protein"
        }
    }

    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.spacing = 8.0
        contentStackView.axis = .vertical
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(caloriesLabel)
        contentStackView.addArrangedSubview(proteinLabel)
        
        
        self.contentView.addSubview(contentStackView)
        
        contentStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16.0).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16.0).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16.0).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16.0).isActive = true
        
        self.contentView.topAnchor.constraint(equalTo: contentStackView.topAnchor, constant: -16.0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 16.0).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: -16.0).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: 16.0).isActive = true
    }
       
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
       
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }

}
