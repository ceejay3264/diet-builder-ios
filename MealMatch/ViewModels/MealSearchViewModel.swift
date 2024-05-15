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
            self.data = data
            completion(true)
        }
    }
}
