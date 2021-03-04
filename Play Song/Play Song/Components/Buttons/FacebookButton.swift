//
//  FacebookButton.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 04/03/21.
//

import SwiftUI
import Firebase
import FBSDKLoginKit

struct FacebookButton: View {

    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = ""
    @State var manager = LoginManager()
    var action: () -> Void = {()}

    var body: some View {
        VStack {
            Button(action: {
                if logged {
                    logout()
                } else {
                    login()
                }
                action()
            }, label: {
                Image(Images.LoginView.facebook)
            })
        }
    }

    func login() {
        manager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if AccessToken.current != nil {
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)

                Auth.auth().signIn(with: credential) { [self] (response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }

                    logged = true
                    email = (response?.user.email)!
                }
            }
        }
    }

    func logout() {
        try? Auth.auth().signOut()
        manager.logOut()
        email = ""
        logged = false
    }
}

struct FacebookButton_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton()
    }
}
