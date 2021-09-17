//
//  JsonParsing.swift
//  APODProject
//
//  Created by Hamed Amiry on 16.09.2021.
//

import Foundation

class JsonParsing {
    
    
    
    static func apiCall (completion: @escaping (Result<[APINetwork],Error>)->Void) {
        
        if let url = URL(string: Constants.theUrl) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else {return}
                do {
                    let json = try JSONDecoder().decode([APINetwork].self, from: data)
                   // print(json)
                    completion(.success(json))
                }
                catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
        
        
    }
    
}

