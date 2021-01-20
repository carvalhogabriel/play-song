//
//  SignUpView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 18/01/21.
//

import SwiftUI


struct SignUpView: View {

    @ObservedObject private var signUpViewModel = SignUpViewModel()

    var body: some View {
        GeometryReader { fullView in
            VStack(spacing: 32) {
                Image(Images.SignUpView.signup)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, minHeight: 0, maxHeight: .some(fullView.size.height / 3))
                    .padding([.top, .bottom], 32)

                VStack(spacing: 32) {
                    TextField("Name", text: $signUpViewModel.name)
                        .textContentType(.name)
                        .disableAutocorrection(true)

                    TextField("Email", text: $signUpViewModel.email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .disableAutocorrection(true)

                    SecureField("Password", text: $signUpViewModel.password)
                        .textContentType(.password)
                        .disableAutocorrection(true)
                }
                .padding([.leading, .trailing], 16)

                RoundedButton(title: "Sign Up") {
                    signUpViewModel.signUp()
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
