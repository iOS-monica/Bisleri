//
//  MenuView.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        HStack (spacing: 35) {
            Image("agc")
            Spacer()
            ZStack {
                Image("oval")
                Image("user")
            }
            Image("add")
            Image("menu")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
