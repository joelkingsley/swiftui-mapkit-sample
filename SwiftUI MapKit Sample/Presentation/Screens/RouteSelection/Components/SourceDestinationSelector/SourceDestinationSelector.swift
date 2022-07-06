//
//  SourceDestinationSelector.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 05/07/2022.
//

import SwiftUI

struct SourceDestinationSelector: View {
    @EnvironmentObject private var routeViewModel: RouteViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(.orange)
                    .frame(width: 5, height: 5, alignment: .center)
                    .padding()
                VStack {
                    HStack {
                        Text("Source")
                            .font(.caption)
                        Spacer()
                    }
                    HStack {
                        Text(routeViewModel.sourceAddress)
                            .bold()
                            .lineLimit(1)
                            .font(.footnote)
                        Spacer()
                    }
                    HStack {
                        Text("///hinders.pinging.bats")
                            .foregroundColor(.orange)
                            .font(.caption)
                        Spacer()
                    }
                }
                Image(systemName: "heart")
                    .padding()
            }
            
            Divider()

            HStack {
                Circle()
                    .fill(.blue)
                    .frame(width: 5, height: 5, alignment: .center)
                    .padding()
                VStack {
                    HStack {
                        Text("Destination")
                            .font(.caption)
                        Spacer()
                    }
                    HStack {
                        Text(routeViewModel.destinationAddress)
                            .bold()
                            .lineLimit(1)
                            .font(.footnote)
                        Spacer()
                    }
                    HStack {
                        Text("///camps.majoring.submerge")
                            .foregroundColor(.orange)
                            .font(.caption)
                        Spacer()
                    }
                    
                }
                Image(systemName: "heart")
                    .padding()
            }
        }
        .background(.white)
        .overlay(
            RoundedRectangle(
                cornerRadius: 5, style: .continuous)
            .stroke(.white)
            .shadow(radius: 5)
        )
        .padding()
    }
}

struct SourceDestinationSelector_Previews: PreviewProvider {
    static var previews: some View {
        SourceDestinationSelector()
    }
}
