//
//  SignUpViewModel.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 20/01/21.
//

import SwiftUI
import Firebase

class SignUpViewModel: ObservableObject {

    // MARK: - Publishers

    @Published var name = ""
    @Published var email = ""
    @Published var password = ""

    @Published var isLoading = false

    var isAllFieldsValid: Bool {
        if !name.isNameValid() ||
            !email.isEmailValid() ||
            !password.isPasswordValid() {
            return false
        }
        return true
    }

    var nameErrorString: String {
        if name.isNameValid() {
            return ""
        } else {
            if name.isEmpty {
                return ""
            } else {
                return "Name must be two letters"
            }
        }
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

    func signUp() {
        isLoading.toggle()

        var ref: DocumentReference? = nil
        let db = Firestore.firestore()

        ref = db.collection("users").addDocument(data: [
            "name": name,
            "email": email,
            "pw": password
        ]) { err in
            self.isLoading.toggle()
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

}
