//
//  LinkButton.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 08/01/21.
//

import SwiftUI

struct LinkButton: View {

    var action: () -> Void = {()}

    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(Color(UIColor.label))
                Text("Sign Up")
                    .foregroundColor(Color(Colors.primaryColor.rawValue))
            }
        })
    }
}

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        LinkButton()
    }
}
