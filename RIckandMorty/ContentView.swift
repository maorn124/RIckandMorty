//
//  ContentView.swift
//  RIckandMorty
//
//  Created by Maor Niv on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authViewModel = AuthViewModel()

    var body: some View {
        if authViewModel.isSignedIn {
            LocationListView(authViewModel: authViewModel)
        } else {
            SignInView(viewModel: authViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
