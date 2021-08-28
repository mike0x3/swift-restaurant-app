//
//  InfoView.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 26/08/21.
//

import SwiftUI

struct InfoView: View {
    
    private let navigationElements: [NavigationElement] = [
        NavigationElement.init(info: "0985704400", icon: UIImage(systemName: "phone.fill")!, action: "tel://0985704400"),
        NavigationElement.init(info: "Via Pippo Baudo 32", icon: UIImage(systemName: "location.fill")!, action: "https://www.google.com/maps/place/La+Vecchia+Cantina+da+Mauro+Roma/@41.887638,12.4964414,13z"),
        NavigationElement.init(info: "info@damauro.it", icon: UIImage(systemName: "envelope.fill")!, action: "mailto:info@damauro.it"),
        NavigationElement.init(info: "https://damauro.it", icon: UIImage(systemName: "globe")!, action: "https://damauro.it"),
        NavigationElement.init(info: "https://facebook.com/damauro", icon: UIImage(systemName: "trash.fill")!, action: "https://facebook.com/damauro")
    ]
    
    @State var name: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var message: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RestaurantLogo()
                        .padding([.top, .bottom])
                    openingHours()
                    contactTable()
                    contactForm()
                }
            }
                .navigationBarTitle("Info", displayMode: .inline)
        }
    }
    
    private func openingHours() -> some View {
        VStack {
            HStack {
                Spacer()
                Text("Orari di apertura")
                    .padding(.top, 3)
                Spacer()
            }
            Text("Da lunedi alla domenica 12-24")
                .padding(.bottom, 3)
        }
        .border(width: 1, edges: [.top, .bottom], color: /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
    
    private func contactTable() -> some View {
        ForEach(self.navigationElements, id: \.info, content: { element in
            Button {
                UIApplication.shared.open(URL(string: element.action)!)
            } label: {
                HStack {
                    Text(element.info)
                        .foregroundColor(.black)
                    Spacer()
                    Image(uiImage: element.icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding()
            }
            
        })
    }
    
    private func contactForm() -> some View {
        VStack {
            Text("SCRIVICI UN MESSAGGIO")
            TextField("Nome", text: $name)
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Telefono", text: $phone)
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $email)
                .padding([.leading, .trailing])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextEditor(text: $message)
                .frame(minHeight: 200, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(Color(.systemGray6))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.trailing, .leading, .bottom])
            Button("Manda", action: {})
                .padding(.bottom)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
