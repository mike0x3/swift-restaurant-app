//
//  MenuView.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 26/08/21.
//

import SwiftUI

struct MenuView: View {
    
    let menuElements: [MenuElement] = [
        MenuElement(title: "Filetto di Orata", image: UIImage(named: "pesce")!, text: "Fresschissimo filetto dell'orata pescato il giorno stesso. Viene servito con una fetta di limone e una porzione di insalata.", price: 12.50, rating: 89, nutritionalValues: ["Valore energetico": "400 Kcal", "Proteine": "23 g", "Carboidrati": "60g", "Grassi": "20 g", "Fibre alimentari": "0g"]),
        MenuElement(title: "Hamburger di manzo dop di Piemonte", image: UIImage(named: "hamburger")!, text: "Hamburger con la carne fresca dagli allevamenti bio di Piemonte, una fetta di cheddar e una di pomodoro per una goduria senza precedenti. Viene servito con una porzione di patatine o insalata (a scelta).", price: 9.70, rating: 73, nutritionalValues: ["Valore energetico": "800 Kcal", "Proteine": "32 g", "Carboidrati": "80 g", "Grassi": "30 g", "Fibre alimentari": "2 g"]),
        MenuElement(title: "Spaghetti all carbonara", image: UIImage(named: "carbonara")!, text: "Classico piatto di cucina romana perfetta per tutte le stagioni e amata da tutti. Fatta col guanciale dop dagli allevamenti di Abbruzzo", price: 17.40, rating: 92, nutritionalValues: ["Valore energetico": "620 Kcal", "Proteine": "12 g", "Carboidrati": "45 g", "Grassi": "13 g", "Fibre alimentari": "5 g"]),
        MenuElement(title: "Filetto di pesce spada", image: UIImage(named: "spada")!, text: "Filetto di pesce spada fresco pescato il giorno stesso nel mar tirreno. Viene servito con una fetta di limone bio cresciuto sulle coste siciliane e un insalata verde condita con olio extravergine di oliva.", price: 18.20, rating: 84, nutritionalValues: ["Valore energetico": "490 Kcal", "Proteine": "33 g", "Carboidrati": "2 g", "Grassi": "15 g", "Fibre alimentari": "0 g"])
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    /*HStack {
                        Spacer()
                        Text("DAI UNO SGUARDO AL NOSTRO MENU")
                            .foregroundColor(.white)
                            .padding(2)
                        Spacer()
                    }
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 2)
                        )
                    .background(Color.black)
                    .padding([.leading, .trailing], 15)
                    .padding(.top, 5)*/
                    ForEach(menuElements, id: \.title, content: { article in
                        NavigationLink(
                            destination: MenuFullPage(element: article),
                            label: {
                                /*Image(uiImage: article.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 95, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.bottom, 10)
                                Text(article.title)
                                    .foregroundColor(.black)
                                Spacer()*/
                                ZStack {
                                    Image(uiImage: article.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(5)
                                        .shadow(radius: 4)
                                        
                                    VStack {
                                        Text(article.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .padding(.top, 50)
                                        Spacer()
                                        HStack {
                                            Image(systemName: "creditcard.fill")
                                                .padding([.bottom, .leading])
                                                .foregroundColor(.white)
                                            Text("\(twoDigitsDouble(number: article.price))€")
                                                .foregroundColor(.white)
                                                .padding(.bottom)
                                            Spacer()
                                            Image(systemName: "hand.thumbsup.fill")
                                                .padding(.bottom)
                                                .foregroundColor(.white)
                                            Text("\(article.rating)%")
                                                .padding([.bottom, .trailing])
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .shadow(radius: 2)
                                }
                                
                            })
                            .padding([.leading, .trailing], 15)
                            .padding(.bottom, 10)
                    })
                    Spacer()
                        
                }
                .padding(.top, 10)
            }
                .navigationBarTitle("Menu", displayMode: .inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuFullPage: View {
    
    let element: MenuElement
    
    var body: some View {
        VStack {
            Image(uiImage: element.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(maxHeight: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(element.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 10)
            Text(element.text)
                .padding([.leading, .trailing], 10)
            List {
                ForEach(element.nutritionalValues.sorted(by: >), id: \.key, content: { key, value in
                    HStack {
                        Text("\(key):")
                        Spacer()
                        Text(value)
                    }
                })
            }
            Spacer()
        }
        .navigationBarTitle(element.title, displayMode: .inline)
        .toolbar(content: {
            Button {
                let textToShare = ["Guarda cosa c'e nel menu di 'Da Mauro' \(element.title): \(element.text)"]
                
               
                let activityVC = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
                
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
        })
    }
}

func twoDigitsDouble(number: Double) -> String {
    return String(format: "%.2f", number)
}
