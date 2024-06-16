//
//  AuthViewModel.swift
//  RIckandMorty
//
//  Created by Maor Niv on 6/15/24.
//

import Foundation
import FirebaseAuth
import Combine

class AuthViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var user: User?

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.isSignedIn = Auth.auth().currentUser != nil
        self.user = Auth.auth().currentUser

        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.isSignedIn = user != nil
            self?.user = user
        }
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
            } else {
                self?.user = authResult?.user
            }
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
            } else {
                self?.user = authResult?.user
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
}
