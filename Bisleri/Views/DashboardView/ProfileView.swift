//
//  ProfileView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack(spacing: 40) {
            CommonSubProfileView(imageName: "upload", textData: "Upload")
            CommonSubProfileView(imageName: "userImage", textData: "John.doe")
                .font(.system(size: 22))
            CommonSubProfileView(imageName: "edit", textData: "Edit")
        }
    }
}

struct CommonSubProfileView: View {
    
    var imageName: String
    var textData: String
    
    var body: some View {
        VStack {
            Image(imageName)
            Text(textData)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
