//
//  FollowersView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct FollowersView: View {
    @State var showDashboard: Bool = true
    var body: some View {
        VStack(spacing: 20) {
            DashboardToggleView(showDashboard: $showDashboard)
            Image("commonSeparator")
            HStack(spacing: 45) {
                FollowerDetailsView(value: "2.3K", heading: "Followers")
                FollowerDetailsView(value: "50", heading: "ArtWorks")
                FollowerDetailsView(value: "21", heading: "Exhibitions")
            }
            Image("commonSeparator")
            HStack(spacing: 30) {
                ShareView(shareIcon: "like", shareCount: "120")
                ShareView(shareIcon: "send", shareCount: "43K")
                ShareView(shareIcon: "share", shareCount: "2.3K")
            }
            PalletteView()
            
        }
        
    }
}

struct DashboardToggleView: View {
    @Binding var showDashboard: Bool
    var body: some View {
        Toggle("My Dashboard", isOn: $showDashboard)
    }
}

struct FollowerDetailsView: View {
    
    var value: String
    var heading: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.system(size: 30))
            Text(heading)
        }
    }
}

struct ShareView: View {
    
    var shareIcon: String
    var shareCount: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(shareIcon)
            Text(shareCount)
                .font(.system(size: 20))
        }
    }
}

struct PalletteView: View {
    
    var body: some View {
        ZStack {
            Image("pallet")
            HStack {
                Text("Pallette")
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                Spacer()
            }
        }
    }
}

struct FollowersView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersView()
    }
}
