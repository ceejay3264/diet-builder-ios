//
//  ViewController.swift
//  MealMatch
//
//  Created by Christopher Cordero on 5/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var margin = 16.0
    private var mealSearchViewModel = MealSearchViewModel()
    
    private let calorieLimitInput: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.placeholder = "What's your calorie limit?"
        view.clipsToBounds = true
        view.keyboardType = .numberPad
        view.backgroundColor = .systemBackground
        view.sizeToFit()
        return view
    }()
    
    private let searchButton: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.setTitle("Find Meals", for: .normal)
        view.tintColor = .white
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8);
        view.addTarget(self, action: #selector(callRecipeNutrientsSearch), for: .touchUpInside)
        return view
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        view.register(RecipeNutrientsTableViewCell.self, forCellReuseIdentifier: RecipeNutrientsTableViewCell.identifier)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        tableView.delegate = self
        tableView.dataSource = self
        
        addConstraints()
    }
    
    @objc func callRecipeNutrientsSearch() {
        if let calorieLimit = calorieLimitInput.text, !calorieLimit.isEmpty {
            mealSearchViewModel.searchForMeals(maxCalories: calorieLimit) { [weak self] didFetch in
                if didFetch, let self = self {
                    self.tableView.reloadData()
                    print(mealSearchViewModel.data.count)
                }
            }
        }
    }

}

// MARK: TableView Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealSearchViewModel.data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataItem = mealSearchViewModel.data[indexPath.row]
        print(dataItem)
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: RecipeNutrientsTableViewCell.identifier, for: indexPath) as? RecipeNutrientsTableViewCell, 
                    let title = dataItem.title,
                    let calories = dataItem.calories,
                    let protein = dataItem.protein {
            cell.recipeTitle = title
            cell.calorieCount = calories
            cell.proteinCount = protein
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: AutoLayout
extension ViewController {
    func addConstraints() {
        self.view.addSubview(calorieLimitInput)
        self.view.addSubview(searchButton)
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            calorieLimitInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: margin),
            calorieLimitInput.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -margin/2.0),
            calorieLimitInput.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            searchButton.leadingAnchor.constraint(equalTo: calorieLimitInput.trailingAnchor, constant: margin/2.0),
            searchButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -margin),
            searchButton.centerYAnchor.constraint(equalTo: calorieLimitInput.centerYAnchor),
            searchButton.heightAnchor.constraint(equalTo: calorieLimitInput.heightAnchor),
            
            tableView.topAnchor.constraint(equalTo: calorieLimitInput.bottomAnchor, constant: margin),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

