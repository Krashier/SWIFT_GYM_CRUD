//
//  textFields.swift
//  Simple CRUD
//
//  Created by Diego on 19/12/24.
//

import SwiftUI

struct textFields: View {
    var name: String
    var binding: Binding<String>
    
    var body: some View {
        TextField(name, text: binding)
            .frame(width: 300, height: 25)
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 3)
                )
            .background(Color.white)
    }
}

#Preview {
    @Previewable @State var previewText = ""
    textFields(name: "Nombre", binding: $previewText)
}
