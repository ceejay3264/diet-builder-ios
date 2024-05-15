//
//  MealSearchViewModel.swift
//  MealMatch
//
//  Created by Christopher Cordero on 5/14/24.
//

import Foundation

class MealSearchViewModel: NSObject {
    
    var data: [RecipeNutrients] = []
    
    func searchForMeals(maxCalories: String, completion: @escaping(Bool) -> Void) {
        
        RecipeNutrientsService.fetchData(number: 10, maxCalories: maxCalories) { data in
            self.data = self.cleanData(data)
            completion(true)
        }
    }
    
    private func cleanData(_ data: [RecipeNutrients]) -> [RecipeNutrients] {
        var cleanData: [RecipeNutrients] = []
        
        for item in data {
            if let title = item.title, let calories = item.calories, let protein = item.protein {
                let newItem = item
                cleanData.append(newItem)
            }
        }
        
        return cleanData
    }
}
