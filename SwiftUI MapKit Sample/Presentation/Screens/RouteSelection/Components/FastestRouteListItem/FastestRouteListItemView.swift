//
//  FastestRouteListItemView.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 05/07/2022.
//

import SwiftUI

struct FastestRouteListItemView: View {
    private let viewModel: FastestRouteListItemViewModel
    
    init(fastestRoute: FastestRoute) {
        self.viewModel = FastestRouteListItemViewModel(fastestRoute: fastestRoute)
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "exclamationmark.octagon")
                Text("Report")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(alignment: .center, spacing: 0) {
                ForEach(viewModel.fastestRoute.routes, id: \.self) { route in
                    VStack(alignment: .center, spacing: 0) {
                        Rectangle()
                            .fill(viewModel.getRectangeColor(forMedium: route.medium))
                            .frame(height: 10, alignment: .center)
                            .padding(.bottom)
                        ZStack {
                            Circle()
                                .fill(.white)
                                .shadow(radius: 5)
                            Image(systemName: viewModel.getMediumIconName(forMedium: route.medium))
                                .frame(width: 30, height: 30, alignment: .center)
                        }
                    }
                }
            }
            
            HStack {
                ForEach(Array(viewModel.fastestRoute.routes.enumerated()), id: \.offset) { index, element in
                    Image(systemName: viewModel.getMediumIconName(forMedium: viewModel.fastestRoute.routes[index].medium))
                        .frame(width: 15, height: 15, alignment: .center)
                    Text(viewModel.fastestRoute.routes[index].durationString)
                        .font(.system(size: 10))
                    if index != viewModel.fastestRoute.routes.count - 1 {
                        Image(systemName: "arrow.right")
                    }
                }
                Spacer()
            }
            .padding(.top)
            
            HStack {
                VStack {
                    HStack {
                        Text("NEXT SCHEDULED")
                            .bold()
                            .font(.system(size: 10))
                        Spacer()
                    }
                    HStack {
                        Text(viewModel.nextScheduledTime)
                            .font(.system(size: 10))
                        Spacer()
                    }
                }
                VStack {
                    HStack {
                        Text("ESTIMATED PRICE")
                            .bold()
                            .font(.system(size: 10))
                        Spacer()
                    }
                    HStack {
                        Text(viewModel.estimatedPrice)
                            .font(.system(size: 10))
                        Spacer()
                    }
                }
                VStack {
                    HStack {
                        Text("TRAVEL TIME")
                            .bold()
                            .font(.system(size: 10))
                        Spacer()
                    }
                    HStack {
                        Text(viewModel.travelTime)
                            .font(.system(size: 10))
                        Spacer()
                    }
                }
                VStack {
                    HStack {
                        Text("DISTANCE")
                            .bold()
                            .font(.system(size: 10))
                        Spacer()
                    }
                    HStack {
                        Text(viewModel.distance)
                            .font(.system(size: 10))
                        Spacer()
                    }
                }
            }
            .padding(.top)
        }
    }
}

struct FastestRouteListItemView_Previews: PreviewProvider {
    static var previews: some View {
        FastestRouteListItemView(
            fastestRoute: FastestRoute(
                routeTitle: "",
                routes: [],
                totalDuration: "",
                totalFare: 14,
                totalDistance: 15
            )
        )
    }
}
