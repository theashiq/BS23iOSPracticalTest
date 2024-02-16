//
//  CustomAsyncImageView.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import SwiftUI

struct CustomAsyncImageView: View {
    let urlString: String
    @State var image: Image
    
    init(urlString: String, placeHolder: String) {
        self.urlString = urlString
        self.image = Image(systemName: placeHolder)
    }
    
    var body: some View{
        image
            .resizable()
            .onAppear{
                fetchImage()
            }
    }
    
    private func fetchImage(){
        
        if let savedUIImage = ImageCache.shared.getImage(for: urlString)
        {
            image = Image(uiImage: savedUIImage)
        }
        else{
            Task{
                if let url = URL(string: urlString),
                   let data = try? await URLSession.shared.data(for:  URLRequest(url: url)).0,
                   let uiImage = UIImage(data: data)
                
                {
                    image = Image(uiImage: uiImage)
                    ImageCache.shared.saveImage(for: urlString, image: uiImage)
                }
            }
        }
        
    }
}

#Preview {
    CustomAsyncImageView(
        urlString: "https://mir-s3-cdn-cf.behance.net/project_modules/fs/66120b94431143.5e7e744dbcbb2.jpg",
        placeHolder: "star"
    )
}
