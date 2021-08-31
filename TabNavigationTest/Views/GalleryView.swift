//
//  GalleryView.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 26/08/21.
//

import SwiftUI

struct GalleryView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Work in progress🚧")
            }
                .navigationBarTitle("Gallery", displayMode: .inline)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(selectedTab: .constant(4))
    }
}
