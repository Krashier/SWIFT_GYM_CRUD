//
//  ContentView.swift
//  Simple CRUD
//
//  Created by Diego on 11/12/24.
//

import SwiftUI

class clientViewModel: ObservableObject {
    
}

struct ContentView: View {
    @State var actualClient: UUID? = nil
    
    @State var name: String = ""
    @State var age: String = ""
    @State var membershipType: String = ""
    @State var telephone: String = ""
    @State var nameButton: String = "Agregar Cliente"
    
    @State var clientes: [datos] = [
        datos(name: "Diego", age: 24, membershipType: "ANUAL", numberPhone: "936469739", date: Date.now),
    ]
    
    func saveData() {
        if let encoded = try? JSONEncoder().encode(clientes) {
            UserDefaults.standard.set(encoded, forKey: "clientes")
        }
    }
    
    func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "clientes"),
            let decoded = try? JSONDecoder().decode([datos].self, from: savedData) {
                clientes = decoded
            }
    }
    
    func clearText() {
        self.name = ""
        self.age = ""
        self.membershipType = ""
        self.telephone = ""
    }
    
    func addClient(name: String, age: String, membershipType: String, telephone: String) {
        if let ageInt = Int(age) {
            let newClient = datos(name: name, age: ageInt, membershipType: membershipType, numberPhone: telephone, date: Date.now)
            clientes.append(newClient)
            clearText()
        } else {
            print("Error")
        }
    }
    
    func editClient(id: UUID) {
        for i in 0..<clientes.count {
            if clientes[i].id == id {
                self.name = clientes[i].name
                self.age = String(clientes[i].age)
                self.membershipType = clientes[i].membershipType
                self.telephone = clientes[i].numberPhone
                self.nameButton = "Editar Cliente"
            }
        }
    }
    
    func updateClient(id: UUID) {
        for i in 0..<clientes.count {
            if clientes[i].id == id {
                if let ageInt = Int(age) {
                    clientes[i].name = name
                    clientes[i].age = ageInt
                    clientes[i].membershipType = membershipType
                    clientes[i].numberPhone = telephone
                }
                clearText()
            }
        }
    }
    
    func deleteClient(id: UUID) {
        for i in 0..<clientes.count {
            if clientes[i].id == id {
                clientes.remove(at: i)
            }
        }
        saveData()
    }
    
    
    var body: some View {
        VStack (spacing: 20){
            ZStack{
                HStack{
                    Text("Gestion de Clientes")
                        .font(.title)
                        .foregroundStyle(Color.black)
                        .bold()
                    Spacer()
                }
                    .padding(20)
            }
            .background(Color.main)
            List(clientes) {client in
                clientCard(id: client.id ,name: client.name, age: client.age, membershipType: client.membershipType, numberPhone: client.numberPhone, date: client.date, editClientID: { id in
                    actualClient = id
                    editClient(id: id)
                }, deleteClientID: { id in
                    deleteClient(id: id)
                })
                    .buttonStyle(.plain)
            }
                .scrollContentBackground(.hidden)
            VStack (spacing: 20){
                textFields(name: "Nombre", binding: $name)
                textFields(name: "Edad", binding: $age)
                textFields(name: "Membresia", binding: $membershipType)
                textFields(name: "Telefono", binding: $telephone)
            }
            Button(nameButton) {
                if nameButton == "Agregar Cliente" {
                    addClient(name: name, age: age, membershipType: membershipType, telephone: telephone)
                    saveData()
                } else if nameButton == "Editar Cliente" {
                    if let validClient = actualClient {
                        updateClient(id: validClient)
                    }
                    nameButton = "Agregar Cliente"
                    saveData()
                }

            }
                .foregroundStyle(.black)
                .bold()
                .frame(width: 300, height: 50)
                .background(Color.main)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 3)
                    )
        }
        .onAppear(perform: loadData)
        .background(Color.background)
    }
}


#Preview {
    ContentView()
}
