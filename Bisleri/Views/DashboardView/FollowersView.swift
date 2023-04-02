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
        DashboardToggleView(showDashboard: $showDashboard)
    }
}

struct DashboardToggleView: View {
    
    @Binding var showDashboard: Bool
    var body: some View {
        Toggle("My Dashboard", isOn: $showDashboard)
    }
}

struct FollowersView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersView()
    }
}
