//
//  RoundedButton.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 01/12/20.
//

import SwiftUI

struct RoundedButton: View {

    var title: String = "Button"
    var foregroundColor: Color = Color(Colors.buttonLabelColor.rawValue)
    var backgroundColor: Color = Color(Colors.primaryColor.rawValue)
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
                    .fill(backgroundColor)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(foregroundColor)
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

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton()
    }
}
