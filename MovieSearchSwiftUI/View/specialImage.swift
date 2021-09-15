//
//  specialImage.swift
//  MovieSearchSwiftUI
//
//  Created by Murat Aslan on 13.09.2021.
//

import SwiftUI

struct specialImage: View {
    
    let url : String
    @ObservedObject var ImageDownClient = imageDownClient()
    
    init(url: String) {
        self.url = url
        self.ImageDownClient.imageDown(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.ImageDownClient.downImage{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeBar")
                .resizable()
        }
        
    }
}

struct specialImage_Previews: PreviewProvider {
    static var previews: some View {
        specialImage(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg)")
    }
}

