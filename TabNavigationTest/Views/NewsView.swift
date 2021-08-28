//
//  NewsView.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 26/08/21.
//

import SwiftUI

struct NewsView: View {
    
    var newsElements: [NewsElement] = [
        NewsElement.init(title: "Zio Pietro da noi!", image: UIImage(named: "pietro")!, text: "Zio Pietro viene a mangiare da noi la sera del 22 agosto. E stato un grande onore accogliere e eservire il matestro", date: "24/08/2021"),
        NewsElement.init(title: "Nuovo arrivo di pesce fresco", image: UIImage(named: "pesce")!, text: "Dalla pescheria di San Vincenzo ogni giorno riceviamo il pesce fresco pescato il giorno stesso. In questa stagionr ogni sera abbiamo l'orata fresca", date: "12/07/2021")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(newsElements, id: \.title, content: { article in
                    NavigationLink(
                        destination: FullPage(element: article),
                        label: {
                            ZStack {
                                Color(.white)
                                    .cornerRadius(5)
                                    .shadow(radius: 1)
                                    .frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                HStack {
                                    Image(uiImage: article.image)
                                        .resizable()
                                        .cornerRadius(5)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(10)
                                    VStack {
                                        Text(article.title)
                                            .foregroundColor(.black)
                                            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        Text(article.date)
                                            .foregroundColor(.gray)
                                            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .font(.system(size: 14))
                                    }
                                    Spacer()
                                }
                                
                            }
                        })
                        .padding([.leading, .trailing], 15)
                        .padding([.bottom, .top], 3)
                })
                Spacer()
            }
                .padding(.top, 5)
                .navigationBarTitle("News", displayMode: .inline)
        }
    }

}

struct FullPage: View {
    
    let element: NewsElement
    
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
                Text(element.date)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .foregroundColor(Color(UIColor.systemGray2))
                Text(element.text)
                    .padding([.leading, .trailing], 10)
                Spacer()
            }
            .navigationBarTitle(element.title, displayMode: .inline)
            .toolbar(content: {
                Button {
                    let textToShare = ["Voglio condividerti questo articolo di 'Da Mauro' \(element.title): \(element.text)"]
                    
                   
                    let activityVC = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            })
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}


