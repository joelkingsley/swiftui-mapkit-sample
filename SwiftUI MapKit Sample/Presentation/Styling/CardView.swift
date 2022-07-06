//
//  CardView.swift
//  SwiftUI MapKit Sample
//
//  Created by Joel Kingsley on 04/07/2022.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.red)
            VStack {
                Text("card.prompt")
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Text("card.answer")
                    .font(.title)
                    .foregroundColor(.gray)
                }
                .padding(20)
                .multilineTextAlignment(.center)
        }
        .frame(width: nil, height: nil, alignment: .center)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
