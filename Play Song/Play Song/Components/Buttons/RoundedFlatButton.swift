//
//  RoundedStrokeButton.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 07/01/21.
//

import SwiftUI

struct RoundedFlatButton: View {

    var title: String = "Button"
    var buttonColor: Color = Color(Colors.primaryColor.rawValue)
    var width: CGFloat = 350
    var action: () -> Void = {()}

    private let height: CGFloat = 50
    private let cornerRadius: CGFloat = 50
    private let lineWidth: CGFloat = 5

    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(buttonColor, lineWidth: lineWidth)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(buttonColor)
            }
        })
        .frame(minWidth: 150,
               idealWidth: 350,
               maxWidth: .some(400),
               minHeight: height,
               idealHeight: height,
               maxHeight: .some(height),
               alignment: .center)
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}

struct RoundedStrokeButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
//            Color(Colors.primaryColor.rawValue).ignoresSafeArea()
            RoundedFlatButton()
        }

    }
}
