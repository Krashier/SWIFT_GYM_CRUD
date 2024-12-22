//
//  clientCard.swift
//  Simple CRUD
//
//  Created by Diego on 12/12/24.
//

import SwiftUI

struct clientCard: View {
    var id: UUID
    var name: String
    var age: Int
    var membershipType: String
    var numberPhone: String
    var date: Date
    
    var editClientID: (UUID) -> Void
    var deleteClientID: (UUID) -> Void
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Nombre: \(name)")
                    .bold()
                Text("Edad: \(age)")
                Text("Membresia: \(membershipType)")
                Text("Telefono: \(numberPhone)")
                Text("Fecha Registro: \(date.formatted(.dateTime.year().month().day()))")
            }
            .padding(.leading)
            Button("a", systemImage: "pencil") {
                editClientID(id)
            }
                .frame(width: 20, height: 20)
                .bold()
                .foregroundStyle(.blue)
            Spacer()
            Button("b", systemImage: "trash.fill") {
                deleteClientID(id)
            }
                .frame(width: 20, height: 20)
                .bold()
                .foregroundStyle(.red)
        }
        
    }
}

#Preview {
    //clientCard(name: "Diego", age: 24, membershipType: "ANUAL", numberPhone: "936469739", date: Date.now)
}
