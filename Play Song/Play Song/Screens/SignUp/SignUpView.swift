//
//  SignUpView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 18/01/21.
//

import SwiftUI
import Firebase

struct SignUpView: View {

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        GeometryReader { fullView in
            VStack(spacing: 32) {
                Image(Images.SignUpView.signup)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, minHeight: 0, maxHeight: .some(fullView.size.height / 3))
                    .padding([.top, .bottom], 32)

                VStack(spacing: 32) {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .disableAutocorrection(true)

                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .disableAutocorrection(true)

                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .disableAutocorrection(true)
                }
                .padding([.leading, .trailing], 16)

                RoundedButton(title: "Sign Up") {
                    print("Signup tapped")
                }.padding([.top,.bottom], 32)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationBarTitle("SignUp", displayMode: .inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
