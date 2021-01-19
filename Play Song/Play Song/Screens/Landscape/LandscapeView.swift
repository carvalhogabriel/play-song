//
//  LandscapeView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 06/01/21.
//

import SwiftUI

struct LandscapeView: View {

    @State private var showLogin = false
    @State private var showSignUp = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(Colors.primaryColor.rawValue)
                    .ignoresSafeArea()

                VStack {
                    Image(Images.LandscapeView.lamp)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0,
                               maxWidth: .some(188),
                               minHeight: 0,
                               maxHeight: .some(199))
                        .ignoresSafeArea()
                    Spacer()

                    Image(Images.LandscapeView.landscape)
                        .resizable()
                        .scaledToFit()
                    Spacer()

                    VStack(alignment: .center, spacing: 32, content: {
                        NavigationLink(destination: LoginView(),
                                       isActive: $showLogin) { EmptyView() }
                        RoundedButton(title: "Login",
                                      foregroundColor: Color(Colors.primaryColor.rawValue),
                                      backgroundColor: Color.white) {
                            showLogin = true
                        }

                        NavigationLink(destination: SignUpView(),
                                       isActive: $showSignUp) { EmptyView() }
                            .navigationBarTitle("")
                        RoundedFlatButton(title: "Sign Up",buttonColor: Color(Colors.buttonLabelColor.rawValue)) {
                            showSignUp = true
                        }
                    })
                    Spacer().frame(maxWidth: .infinity,
                                   minHeight: 32,
                                   idealHeight: 32,
                                   maxHeight: .some(32),
                                   alignment: .center)
                }
            }.navigationBarHidden(true)
        }.accentColor(Color(Colors.primaryColor.rawValue))
    }
}

struct LandscapeView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeView()
    }
}
