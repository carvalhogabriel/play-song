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
    @State private var isEditing = false
    @State private var showSignUp = false

    var body: some View {
        VStack(spacing: 32) {
            if !isEditing {
                Image(Images.LoginView.login)
                    .resizable()
                    .scaledToFit()
                    .padding([.top], 32)
            }

            ScrollView(.vertical, showsIndicators: true, content: {
                VStack(spacing: 32) {

                    TextField("Email", text: $email, onEditingChanged: { isEditing in
                        self.isEditing = isEditing

                    })
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    SecureField("Password", text: $password)
                        .keyboardType(.default)
                        .textContentType(.password)
                        .disableAutocorrection(true)
                }
                .padding([.leading, .trailing], 16)

                RoundedButton(title: "Login")
                    .padding([.top, .bottom], 64)

                HStack(alignment: .center, spacing: 32) {
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

                NavigationLink(destination: ContentView(),
                               isActive: $showSignUp) { EmptyView() }
                LinkButton {
                    showSignUp = true
                }.padding([.top, .bottom], 32)
            })
            .padding(.bottom)
            .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
