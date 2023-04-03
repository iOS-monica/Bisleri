//
//  DashboardDetailsView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct DashboardDetailsView: View {
    
    @Binding var photos: [DashboardPhoto]
    
    var body: some View {
        TabbedView()
        UploadView(photos: $photos)
    }
}

struct TabbedView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    CommonImageWithTextView(imageName: "upload", textData: "Upload")
                    Image("selected")
                }
                Spacer()
                CommonImageWithTextView(imageName: "exhibition", textData: "Exhibitions")
                Spacer()
                CommonImageWithTextView(imageName: "revenue", textData: "Revenue")
            }
            .padding()
            
        }
    }
}

struct UploadView: View {
    
    @Binding var photos: [DashboardPhoto]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(photos, id: \.self) { item in
                CommonURLImageView(imageURL: item.url,
                                   height: 150,
                                   width: 150)
            }
        }
        .padding(.horizontal)
    }
}

struct CommonURLImageView: View {
    
    var imageURL: String
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)!,
                   placeholder: { CommonImageView(imageName: "placeHolderImage",
                                                  height: height,
                                                  width: width) },
                   image: { Image(uiImage: $0).resizable() })
            .scaledToFit()
    }
}

struct CommonImageView: View {
    
    var imageName: String
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: width,
                   height: height,
                   alignment: .center)
    }
}

