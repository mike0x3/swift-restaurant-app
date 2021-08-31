//
//  HomeView.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 26/08/21.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundImage()
                ScrollView {
                    Spacer()
                        .frame(height: 350)
                    VStack {
                        newsSection()
                        menuSection()
                        socialSection()
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .ignoresSafeArea()
                }
            }
                .navigationBarTitle("Da Mauro", displayMode: .inline)
        }
    }
    
    private func backgroundImage() -> some View {
        Image("vsala3")
            .resizable()
            .aspectRatio(UIImage(named: "vsala2")!.size, contentMode: .fill)
            .frame(maxWidth: UIScreen.main.bounds.width,
                                   maxHeight: UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.all)
    }
    
    private func newsSection() -> some View {
        VStack {
            HStack {
                Text("In primo piano")
                    .font(.custom("Avenir-MediumOblique", size: 29))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                Spacer()
                Button {
                    selectedTab = 2
                } label: {
                    Text("Vedi tutto")
                        .font(.custom("Avenir-MediumOblique", size: 15))
                        .underline()
                        .padding(.trailing, 10)
                        .padding(.top)
                        .foregroundColor(.black)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(newsElements, id: \.title, content: { article in
                        NavigationLink(
                            destination: FullPage(element: article),
                            label: {
                                ZStack {
                                    Image(uiImage: article.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 230)
                                        .cornerRadius(5)
                                        .shadow(radius: 4)
                                    VStack {
                                        Text(article.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .padding(.top, 30)
                                        Spacer()
                                        Text(article.date)
                                            .padding([.bottom, .leading], 15)
                                            .padding(.leading)
                                            .foregroundColor(.white)
                                            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .font(.system(size: 14))
                                    }
                                    .frame(height: 230)
                                    .shadow(radius: 2)
                                }
                                .padding([.leading, .trailing], 5)
                            })
                            .padding([.bottom, .top], 10)
                    })
                    
                }
                
            }
        }
    }
    private func menuSection() -> some View {
        VStack {
            HStack {
                Text("Le nostre specialita")
                    .font(.custom("Avenir-MediumOblique", size: 29))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                Spacer()
                Button {
                    selectedTab = 1
                } label: {
                    Text("Vedi tutto")
                        .font(.custom("Avenir-MediumOblique", size: 15))
                        .underline()
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                        .padding(.top)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
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
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 230)
                                        .cornerRadius(5)
                                        .shadow(radius: 4)
                                        
                                    VStack {
                                        Text(article.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .padding(.top, 30)
                                        Spacer()
                                        HStack {
                                            Image(systemName: "creditcard.fill")
                                                .padding(.bottom)
                                                .padding(.leading, 30)
                                                .foregroundColor(.white)
                                            Text("\(twoDigitsDouble(number: article.price))€")
                                                .foregroundColor(.white)
                                                .padding(.bottom)
                                            Spacer()
                                            Image(systemName: "hand.thumbsup.fill")
                                                .padding(.bottom)
                                                .foregroundColor(.white)
                                            Text("\(article.rating)%")
                                                .padding(.bottom)
                                                .padding(.trailing, 30)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .frame(height: 230)
                                    .shadow(radius: 2)
                                }
                                
                            })
                            .padding([.leading, .trailing], 10)
                            .padding(.bottom, 10)
                    })
                }
            }
        }
    }
    private func socialSection() -> some View {
        VStack {
            HStack {
                Text("I nostri social")
                    .font(.custom("Avenir-MediumOblique", size: 29))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                Button {
                    selectedTab = 5
                } label: {
                    Text("Vedi tutto")
                        .font(.custom("Avenir-MediumOblique", size: 15))
                        .underline()
                        .padding(.trailing, 10)
                        .padding(.top)
                        .foregroundColor(.black)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(SocialMediaData, id: \.title, content: { element in
                        Button {
                            UIApplication.shared.open(element.link)
                        } label: {
                            VStack {
                                Image(uiImage: element.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .shadow(radius: 1)
                                Text(element.title)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding([.leading, .trailing], 8)
                    })
                }
            }
            .padding(.leading, 8)
            .padding(.bottom, 30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(3))
    }
}
