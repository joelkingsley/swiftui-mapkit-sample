//
//  RouteSelectionScreen.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import SwiftUI

struct RouteSelectionScreen: View {
    @EnvironmentObject private var routeViewModel: RouteViewModel
    @State private var selection: Int?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SourceDestinationSelector()
                        .environmentObject(routeViewModel)
                    
                    HStack {
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .shadow(radius: 5)
                                Image(systemName: "tram.fill")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .foregroundColor(.gray)
                            }
                            Text("Metro")
                                .bold()
                                .foregroundColor(.gray)
                        }
                        .frame(width: 110, height: nil, alignment: .leading)
                        .padding()
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .shadow(radius: 5)
                                Image(systemName: "bus.fill")
                                    .frame(width: 30, height: 30, alignment: .center)
                            }
                            Text("Bus")
                                .bold()
                        }
                        .frame(width: 110, height: nil, alignment: .leading)
                        .padding()
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("FASTEST ROUTE")
                                .bold()
                                .font(.subheadline)
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.leading)
                        
                        VStack {
                            ForEach(Array(routeViewModel.fastestRoutesData.enumerated()), id: \.offset) { index, fastestRoute in
                                VStack {
                                    NavigationLink(tag: index, selection: $selection) {
                                        RouteDetailScreen(fastestRoute: fastestRoute)
                                    } label: {
                                        EmptyView()
                                    }

                                    FastestRouteListItemView(fastestRoute: fastestRoute)
                                        .padding()
                                    Divider()
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selection = index
                                }
                            }
                        }
                        .background(.white)
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 25, style: .continuous)
                            .stroke(.white)
                        )
                        .padding()
                    }

                    Spacer()
                }
            }
            .background(
                Color(uiColor: .systemGray6)
                    .ignoresSafeArea(.all)
            )
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct RouteSelectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        RouteSelectionScreen()
    }
}
