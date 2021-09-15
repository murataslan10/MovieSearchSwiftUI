//
//  ImageDownClient.swift
//  MovieSearchSwiftUI
//
//  Created by Murat Aslan on 13.09.2021.
//

import Foundation

class imageDownClient : ObservableObject {
    @Published var downImage : Data?
    
    func imageDown(url :String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downImage = data
            }
        }.resume()
    }
}











