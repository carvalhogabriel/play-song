//
//  EntryField.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 21/01/21.
//

import SwiftUI

struct EntryField: View {

    var placeholder: String
    @Binding var field: String
    var isSecure: Bool
    var errorText: String
    var textContentType: UITextContentType? = .none
    var keyboardType: UIKeyboardType?

    var body: some View {
        VStack(alignment: .leading) {
            if isSecure {
                SecureField(placeholder, text: $field)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(textContentType)
                    .keyboardType(keyboardType ?? .default)
            } else {
                TextField(placeholder, text: $field)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(textContentType)
                    .keyboardType(keyboardType ?? .default)
            }
            Text(errorText)
                .foregroundColor(Color(UIColor.systemRed))
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
        .padding([.leading, .trailing], 16)
    }
}

struct EntryField_Previews: PreviewProvider {

    @State static var placeholder = ""
    @State static var name = "Gabriel"
    @State static var password = "123456"

    static var previews: some View {
        VStack {
            EntryField(placeholder: "Placeholder",
                       field: $placeholder,
                       isSecure: false,
                       errorText: "This is a error displayed at view")
            EntryField(placeholder: "Name",
                       field: $name,
                       isSecure: false,
                       errorText: "This is a error displayed at view",
                       textContentType: .name,
                       keyboardType: .default)
            EntryField(placeholder: "Password",
                       field: $password,
                       isSecure: true,
                       errorText: "This is a error displayed at view",
                       textContentType: .password)
        }
    }

}
