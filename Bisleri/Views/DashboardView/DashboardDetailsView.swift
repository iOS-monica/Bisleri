//
//  DashboardDetailsView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct DashboardDetailsView: View {
    var body: some View {
        TabbedView()
        UploadView()
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
    
     let data = (1...2).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(data, id: \.self) { item in
                // Image("userImage")
            }
        }
        .padding(.horizontal)
    }
}

struct CommonURLImageView: View {
    
    var imageURL: String
    var placeHolderImage: String
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        
//        KFImage(URL(string: imageURL))
//            .placeholder { CommonImageView(imageName: "placeHolderImage",
//                                           height: height,
//                                           width: width) }
//            .resizable()
//            .scaledToFit()
//            .frame(width: width, height: height, alignment: .center)
        
        AsyncImage(url: URL(string: imageURL)!,
                       placeholder: { CommonImageView(imageName: "placeHolderImage",
                                                                         height: height,
                                                                         width: width) },
                       image: { Image(uiImage: $0).resizable() })
               .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3)
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

struct DashboardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardDetailsView()
    }
}
