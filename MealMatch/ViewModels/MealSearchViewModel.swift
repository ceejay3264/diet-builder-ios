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
        
        RecipeNutrientsService.fetchData(number: 10, maxCalories: maxCalories) { [weak self] data in
            guard let self = self else {
                completion(false)
                return
            }
            
            self.data = self.cleanData(data)
            completion(true)
        }
    }
    
    private func cleanData(_ data: [RecipeNutrients]) -> [RecipeNutrients] {
        var cleanData: [RecipeNutrients] = []
        
        for item in data {
            if let _ = item.title, let _ = item.calories, let _ = item.protein {
                let newItem = item
                cleanData.append(newItem)
            }
        }
        
        return cleanData
    }
}
