//
//  drinkService.swift
//  CocktailApp
//
//  Created by user235857 on 4/19/24.
//

import Foundation

class drinkService{
    
    
    static var shared = drinkService()
        
        func getListOfCocktails(searchText: String, completiongHandler: @escaping (CocktailListResponse)->Void){
           
            let urlObj = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i="+searchText)!
            let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
                
                if error != nil {
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                           (200...299).contains(httpResponse.statusCode) else {
                    return
                       }
                if let jsonString = String(data: data!, encoding: .utf8) {
                    print(jsonString)
                    // convert json string ===> List of String
                    do{
                        let listOfCocktails = try JSONDecoder().decode(CocktailListResponse.self, from: data!)
                        completiongHandler(listOfCocktails)
                        
                    }
                    catch{
                        print(error)
                        
                    }
                    
            }
            }
            
            task.resume()
        }
    
    func getCocktailDetails(searchId: String, completiongHandler: @escaping (CocktailListResponse)->Void){
       
        let urlObj = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="+searchId)!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            
            if error != nil {
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                return
                   }
            if let jsonString = String(data: data!, encoding: .utf8) {
                print(jsonString)
                // convert json string ===> List of String
                do{
                    let cocktail = try JSONDecoder().decode(CocktailListResponse.self, from: data!)
                    completiongHandler(cocktail)
                    
                }
                catch{
                    print(error)
                    
                }
                
        }
        }
        
        task.resume()
    }
    
    
    
    
    
    
    
}
