//
//  RecipeNutrientsService.swift
//  MealMatch
//
//  Created by Christopher Cordero on 5/14/24.
//

import Foundation
import Alamofire

class RecipeNutrientsService {
    static let baseURL = "https://api.spoonacular.com/recipes/findByNutrients"
    
    static func fetchData(number: Int, maxCalories: String, completion: @escaping([RecipeNutrients]) -> Void) {
        let parameters: Parameters = [
            "apiKey": "77ec36948886469ab48fbe76fb46879e",
            "number": String(number),
            "maxCalories": maxCalories
        ]
        
        AF.request(baseURL, method: .get, parameters: parameters)
        
            .response{ resp in
                switch resp.result{
                    case .success(let data):
                        if let data = data {
                            do{
                                let jsonData = try JSONDecoder().decode([RecipeNutrients].self, from: data)
                                completion(jsonData)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                     case .failure(let error):
                       print(error.localizedDescription)
                 }
            }
       }
    
}
