//
//  SignUpViewModel.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 20/01/21.
//

import SwiftUI

class SignUpViewModel: ObservableObject {

    // MARK: - Publishers

    @Published private var model = SignUpModel()

    // MARK: - Access to the Model

    var name: String {
        get {
            model.name
        }
        set {
            model.name = newValue
        }
    }

    var email: String {
        get {
            model.email
        }
        set {
            model.email = newValue
        }
    }

    var password: String {
        get {
            model.password
        }
        set {
            model.password = newValue
        }
    }

    // MARK: - Intent(s)

    func signUp() {
        model.signUp()
    }
}
