//
//  LandmarkList.swift
//  SwiftUI-Sample
//
//  Created by Shinji Kurosawa on 2019/06/13.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    var body: some View {
        Text("hoge")
//        NavigationView {
//            List(landmarkData.identified(by: \.id)) { landmark in
//                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
//            .navigationBarTitle(Text("Landmarks"))
//        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
//        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
#endif
