//
//  ContentView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 01/12/20.
//

import SwiftUI
import Firebase

struct ContentView: View {

    var body: some View {
        VStack{
            RoundedButton(title: "Cadastrar") {
                Auth.auth().createUser(withEmail: "gabrielcarvalho2905@gmail.com",
                                       password: "Password#123") { authResult, error in
                    print(authResult ?? "")
                    print(error ?? "")
                }
            }
            RoundedButton(title: "Logar") {
                Auth.auth().signIn(withEmail: "gabrielcarvalho2905@gmail.com", password: "Password#123") { (authResult, error) in
                    print(authResult ?? "")
                    print(error ?? "")
                }
            }
            RoundedButton(title: "Adicionar Dados") {
                var ref: DocumentReference? = nil
                let db = Firestore.firestore()
                ref = db.collection("users").addDocument(data: [
                    "first": "Ada",
                    "last": "Lovelace",
                    "email": "gabrielcarvalho2905@gmail.com"
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
            RoundedButton(title: "Ler Dados") {
                let db = Firestore.firestore()
                db.collection("users").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
