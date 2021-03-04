//
//  LoginView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 08/01/21.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject private var loginViewModel = LoginViewModel()

    var body: some View {
        GeometryReader { fullView in
            VStack(spacing: 32) {
                Image(Images.LoginView.login)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, minHeight: 0, maxHeight: .some(fullView.size.height / 4))
                    .padding([.top], 32)

                ScrollView(.vertical, showsIndicators: true, content: {
                    VStack(spacing: 16) {
                        EntryField(placeholder: "Email",
                                   field: $loginViewModel.email,
                                   isSecure: false,
                                   errorText: loginViewModel.emailErrorString,
                                   textContentType: .emailAddress)

                        EntryField(placeholder: "Password",
                                   field: $loginViewModel.password,
                                   isSecure: false,
                                   errorText: loginViewModel.passwordErrorString,
                                   textContentType: .password)
                    }

                    RoundedButton(title: "Login")
                        .padding([.top, .bottom], 64)

                    HStack(alignment: .center, spacing: 32) {
                        NavigationLink(destination: ContentView(),
                                       isActive: $loginViewModel.showHome) { EmptyView() }
                        FacebookButton {
                            loginViewModel.showHome = true
                        }
//                        Button(action: {
//                            print("Facebook Button")
//                        }, label: {
//                            Image(Images.LoginView.facebook)
//                        })

                        Button(action: {
                            print("Google Button")
                        }, label: {
                            Image(Images.LoginView.google)
                        })
                    }

                    NavigationLink(destination: SignUpView(),
                                   isActive: $loginViewModel.showSignUp) { EmptyView() }
                        .navigationBarTitle("")
                    LinkButton {
                        loginViewModel.showSignUpScreen()
                    }.padding([.top, .bottom], 32)
                })
                .padding(.bottom)
                .navigationTitle("Login")
                .navigationBarBackButtonHidden(true)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationTitle("Login")
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
