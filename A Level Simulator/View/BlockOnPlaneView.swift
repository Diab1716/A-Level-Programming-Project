//
//  BlockOnPlaneView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 10/10/2022.
//

import SwiftUI
import SpriteKit

struct BlockOnPlaneView: View {
    var rampScene = RampScene(size: CGSize(width: 400, height: 200))
    
    
    var body: some View {
        VStack{
            SpriteView(scene: self.rampScene)
                .frame(width: 400, height: 200)
        }
    }
}

struct BlockOnPlaneView_Previews: PreviewProvider {
    static var previews: some View {
        BlockOnPlaneView()
    }
}
