//
//  DashboardView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                MenuView()
                ProfileView()
                FollowersView()
                DashboardDetailsView()
            }
            .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
