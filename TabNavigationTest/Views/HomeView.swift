//
//  HomeView.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 26/08/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("sala")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                RestaurantLogo()
                    
                Button("facebook", action: {
                    UIApplication.shared.open(URL(string: "https://facebook.com/damauro")!)
                })
                    .padding()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras turpis dolor, eleifend id eros id, dapibus consequat turpis. Nulla nisl metus, tempus non orci non, posuere laoreet orci. Morbi dictum tellus vitae arcu tincidunt, quis vestibulum ante porta. Proin accumsan, quam eu pellentesque elementum, nisl nisi eleifend velit, at pharetra dui felis in enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed sem vel nisl vestibulum ultrices vitae vel tellus. Mauris consequat tristique enim at commodo. Nunc non auctor nisi, id auctor est. Donec rhoncus eu ipsum non dictum. Nunc quis luctus velit. Vivamus porttitor est non ultricies maximus. Cras vitae augue ac sapien pharetra lacinia.")
                    .padding()
                Spacer()
            }
                .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
