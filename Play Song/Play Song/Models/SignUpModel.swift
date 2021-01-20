//
//  SignUpModel.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 20/01/21.
//

import SwiftUI
import Firebase

class SignUpModel: ObservableObject {

    // MARK: - Properties

    var name = ""
    var email = ""
    var password = ""

    // MARK: - Methods

    func signUp() {
        print("SignUp Model called\nname: \(name)\nemail: \(email)\npassword: \(password)")

        var ref: DocumentReference? = nil
        let db = Firestore.firestore()
        ref = db.collection("users").addDocument(data: [
            "name": name,
            "email": email,
            "pw": password
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
