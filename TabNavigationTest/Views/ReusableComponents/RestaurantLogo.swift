//
//  RestaurantLogo.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 28/08/21.
//

import SwiftUI

struct RestaurantLogo: View {
    var body: some View {
        VStack {
            Image("logo2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Da Mauro")
                .font(.title)
            Text("Produzione Propria")
        }
    }
}

struct RestaurantLogo_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantLogo()
    }
}
