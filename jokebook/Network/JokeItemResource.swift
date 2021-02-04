//
//  JokeItemResource.swift
//  jokebook
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import Foundation

protocol JokeItemResourceProtocol {
    func getJokeItems(category: String, completionHandler: @escaping(_ result: [JokeItems?])-> Void)
}

struct JokeItemResource: JokeItemResourceProtocol{
    func getJokeItems(category: String, completionHandler: @escaping ([JokeItems?]) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://official-joke-api.appspot.com/jokes/\(category)/ten")!)) { (responseData, urlResponse, serverError) in

            if(serverError == nil)
            {
                do {
                    let result = try JSONDecoder().decode([JokeItems].self, from: responseData!)
                    completionHandler(result)
                } catch  {
                    debugPrint(error)
                }
            }
        }.resume()
    }
}
