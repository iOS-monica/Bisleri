//
//  DashboardView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(spacing: 20) {
            MenuView()
            ProfileView()
            FollowersView()
        }
        .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
