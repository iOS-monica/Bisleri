//
//  DashboardView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var viewModel = DashboardViewModel()
    
    private var contentView: some View {
        ScrollView {
            VStack(spacing: 20) {
                MenuView()
                ProfileView()
                FollowersView()
                DashboardDetailsView()
            }
            .padding()
        }
        .onAppear {
            viewModel.getUploadDetails()
        }
    }
    
    var body: some View {
        ZStack {
            contentView
            if viewModel.showProgressView {
                ActivityIndicatorView()
            }
        }
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
