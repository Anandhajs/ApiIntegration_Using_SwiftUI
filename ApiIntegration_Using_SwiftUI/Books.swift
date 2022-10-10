//
//  Books.swift
//  API_Integration_Using_SwiftUI
//
//  Created by Apple on 10/10/22.
//

import Foundation
import SwiftUI


class ApiCalling : ObservableObject{

    func loadData(completion: @escaping ([Images]) -> ()) {
        let token = "Client-ID NiptWIsMOSUKIxunkNGSE5A5lTaT_GI7EDauLTiAyHY"
        guard let url = URL(string: "https://api.unsplash.com/photos?page=1") else {
            print("Invalid url...")
            return
        }


        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let books = try JSONDecoder().decode([Images].self, from: data)
                DispatchQueue.main.async {
                    completion(books)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
