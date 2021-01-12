//
//  LoginView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 08/01/21.
//

import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack {
                Image(Images.LoginView.login)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 230, alignment: .center)
                    .padding(32)

                VStack(spacing: 32) {
                    TextField("E-mail", text: $email)
                    TextField("Password", text: $password)
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)

                RoundedButton(title: "Login")
                    .padding(.top, 64)
                    .padding(.bottom, 64)

                HStack(spacing: 32) {
                    Button(action: {
                        print("Facebook Button")
                    }, label: {
                        Image(Images.LoginView.facebook)
                    })

                    Button(action: {
                        print("Facebook Button")
                    }, label: {
                        Image(Images.LoginView.google)
                    })
                }

                LinkButton {
                    print("LinkButton Action")
                }
                Spacer()
                    .frame(height: 32)
            }

        }.navigationBarTitle("Login")
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
