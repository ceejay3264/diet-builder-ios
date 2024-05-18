//
//  RecipeNutrientsService.swift
//  MealMatch
//
//  Created by Christopher Cordero on 5/14/24.
//

import Foundation

class RecipeNutrientsService {
    static let baseURL = "https://api.spoonacular.com/recipes/findByNutrients"
    
    static func fetchData(number: Int, maxCalories: String, completion: @escaping([RecipeNutrients]) -> Void) {
        let parameters: [URLQueryItem] = [
            URLQueryItem(name: "apiKey", value: "77ec36948886469ab48fbe76fb46879e"),
            URLQueryItem(name: "number", value: String(number)),
            URLQueryItem(name: "maxCalories", value: maxCalories)
        ]
        
//        AF.request(baseURL, method: .get, parameters: parameters)
//        .response{ resp in
//            switch resp.result{
//                case .success(let data):
//                    if let data = data {
//                        do {
//                            let jsonData = try JSONDecoder().decode([RecipeNutrients].self, from: data)
//                            completion(jsonData)
//                        } catch {
//                            print(error.localizedDescription)
//                        }
//                    }
//                 case .failure(let error):
//                   print(error.localizedDescription)
//             }
//        }
        if var urlComponents = URLComponents(string: baseURL) {
            urlComponents.queryItems = parameters
            if let url = urlComponents.url {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    // Check for error
                    if let error = error {
                        print(error.localizedDescription)
                        completion([])
                        return
                    }
                    
                    // Check if data is non-null
                    if let data = data {
                        do {
                            //JSON decoding
                            let jsonData = try JSONDecoder().decode([RecipeNutrients].self, from: data)
                            completion(jsonData)
                            return
                        } catch {
                            print("RecipeNutrients DECODING ERROR")
                            completion([])
                            return
                        }
                        
                    } else {
                        completion([])
                        return
                    }
                    
                    
                    
                 }.resume()
            }
        }
        
        
        
    }
        
        
    
}
