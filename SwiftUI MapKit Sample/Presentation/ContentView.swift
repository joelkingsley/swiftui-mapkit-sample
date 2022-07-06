//
//  ContentView.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var routeViewModel = RouteViewModel()
    
    var body: some View {
        RouteSelectionScreen()
            .background(
                Color(uiColor: .systemGray6)
                    .ignoresSafeArea(.all)
            )
            .environmentObject(routeViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
