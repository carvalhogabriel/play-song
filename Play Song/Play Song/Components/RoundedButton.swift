//
//  RoundedButton.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 01/12/20.
//

import SwiftUI

struct RoundedButton: View {

    var title: String = "Button"
    var foregroundColor: Color = Color(UIColor.systemBackground)
    var backgroundColor: Color = Color(Colors.primaryColor.rawValue)
    var width: CGFloat = 350
    var action: () -> Void = {()}

    var body: some View {
        Button(action: {
                action()
        }, label: {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: width, height: 50, alignment: .center)
                .foregroundColor(backgroundColor)
                .overlay(Text(title)
                            .foregroundColor(foregroundColor))
        })
    }

}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton()
    }
}
