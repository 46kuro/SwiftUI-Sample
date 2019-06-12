//
//  CircleImage.swift
//  SwiftUI-Sample
//
//  Created by Shinji Kurosawa on 2019/06/12.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 4))
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
