//
//  ContentView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 01/12/20.
//

import SwiftUI
import FirebaseAuth

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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
