//
//  GestureSample.swift
//  GestureSample
//
//  Created by Shinji Kurosawa on 2019/10/28.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

import SwiftUI

struct GestureSample: View {
    @State private var offset: CGSize = .zero

    var body: some View {
        let drag = DragGesture()
            .onChanged { self.offset = $0.translation }
            .onEnded {
                if $0.translation.width < -100 {
                    self.offset = .init(width: -1000, height: 0)
                } else if $0.translation.width > 100 {
                    self.offset = .init(width: 1000, height: 0)
                } else {
                    self.offset = .zero
                }
        }

        return PersonView()
            .background(Color.red)
            .cornerRadius(8) 
            .shadow(radius: 8)
            .padding()
            .offset(x: offset.width, y: offset.height)
            .gesture(drag)
            .animation(.spring())
    }
}

struct PersonView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray)
                .cornerRadius(8)
                .frame(height: 300)

            Text("Majid Jabrayilov")
                .font(.title)
                .foregroundColor(.white)

            Text("iOS Developer")
                .font(.body)
                .foregroundColor(.white)
        }.padding()
    }
}
