//
//  SignInView.swift
//  RIckandMorty
//
//  Created by Maor Niv on 6/15/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            Button(action: {
                viewModel.signIn(email: email, password: password)
            }) {
                Text("Sign In")
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: {
                viewModel.signUp(email: email, password: password)
            }) {
                Text("Sign Up")
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: AuthViewModel())
    }
}
