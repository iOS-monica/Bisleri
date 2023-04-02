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
    
   // let data = (1...100).map { "Item \($0)" }
    
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



struct DashboardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardDetailsView()
    }
}
