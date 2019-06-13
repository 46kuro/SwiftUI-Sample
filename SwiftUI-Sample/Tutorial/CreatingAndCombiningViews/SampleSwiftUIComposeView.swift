//
//  SampleSwiftUIComposeView.swift
//  SwiftUI-Sample
//
//  Created by Shinji Kurosawa on 2019/06/12.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct SampleSwiftUIComposeView : View {
    var body: some View {
        VStack {
            MapView(coordinate: landmarkData[0].locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack {
                Text("Turtle Rock")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#if DEBUG
struct SampleSwiftUIComposeView_Previews : PreviewProvider {
    static var previews: some View {
        SampleSwiftUIComposeView()
    }
}
#endif
