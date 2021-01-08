//
//  LandscapeView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 06/01/21.
//

import SwiftUI

struct LandscapeView: View {

    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        ZStack {
            Color(Colors.primaryColor.rawValue)
                .ignoresSafeArea()

            VStack {
                Image(Images.lamp.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, idealWidth: 188, maxWidth: .some(188), minHeight: 0, idealHeight: 199, maxHeight: .some(199), alignment: .top)
                    .ignoresSafeArea()
                Spacer()

                Image(Images.landscape.rawValue)
                    .resizable()
                    .scaledToFit()
                Spacer()

                VStack(alignment: .center, spacing: 32, content: {
                    RoundedButton(title: "Login",
                                  foregroundColor: Color(Colors.primaryColor.rawValue),
                                  backgroundColor: Color.white)
                    RoundedFlatButton(title: "Sign Up",buttonColor: Color(Colors.buttonLabelColor.rawValue))
                })
                Spacer().frame(maxWidth: .infinity, minHeight: 32, idealHeight: 32, maxHeight: .some(32), alignment: .center)
            }
        }
    }
}

struct LandscapeView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeView()
    }
}
