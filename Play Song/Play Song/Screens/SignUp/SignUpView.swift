//
//  SignUpView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 18/01/21.
//

import SwiftUI


struct SignUpView: View {

    @ObservedObject private var signUpViewModel = SignUpViewModel()

    private var signUpButtonColor: Color {
        signUpViewModel.isAllFieldsValid ? Color(Colors.primaryColor.rawValue) : Color.gray
    }
    
    var body: some View {
        GeometryReader { fullView in
            VStack(spacing: 32) {
                Image(Images.SignUpView.signup)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, minHeight: 0, maxHeight: .some(fullView.size.height / 3))
                    .padding([.top, .bottom], 32)

                VStack(spacing: 16) {
                    EntryField(placeholder: "Name",
                               field: $signUpViewModel.name,
                               isSecure: false,
                               errorText: signUpViewModel.nameErrorString,
                               textContentType: .name)

                    EntryField(placeholder: "Email",
                               field: $signUpViewModel.email,
                               isSecure: false,
                               errorText: signUpViewModel.emailErrorString,
                               textContentType: .emailAddress,
                               keyboardType: .emailAddress)

                    EntryField(placeholder: "Password",
                               field: $signUpViewModel.password,
                               isSecure: true,
                               errorText: signUpViewModel.passwordErrorString,
                               textContentType: .password)
                }

                RoundedButton(title: signUpViewModel.isLoading ? "Loading..." : "Sign Up",
                              backgroundColor: signUpButtonColor) {
                    signUpViewModel.signUp()
                }.padding([.top,.bottom], 32)
                .disabled(!signUpViewModel.isAllFieldsValid || signUpViewModel.isLoading)
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
