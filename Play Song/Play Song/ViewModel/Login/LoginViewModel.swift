//
//  LoginViewModel.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 25/01/21.
//

import Foundation

class LoginViewModel: ObservableObject {

    // MARK: - Publishers

    @Published var email = ""
    @Published var password = ""

    @Published var showSignUp = false
    @Published var showHome = false

    // MARK: - Validators
    var isAllFieldsValid: Bool {
        if !email.isEmailValid() ||
            !password.isPasswordValid() {
            return false
        }
        return true
    }

    var emailErrorString: String {
        if email.isEmailValid() {
            return ""
        } else {
            if email.isEmpty {
                return ""
            } else {
                return "Enter a valid email address"
            }
        }
    }

    var passwordErrorString: String {
        if password.isPasswordValid() {
            return ""
        } else {
            if password.isEmpty {
                return ""
            } else {
                return "Password must be six characters"
            }
        }
    }

    // MARK: - Method's
    func showSignUpScreen() {
        showSignUp = true
    }

    func showHomeScreen() {
        showHome = true
    }

}
