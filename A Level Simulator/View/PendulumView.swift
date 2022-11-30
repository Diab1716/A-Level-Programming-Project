//
//  PendulumView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 23/11/2022.
//

import SwiftUI
import SpriteKit

struct PendulumView: View {
    var test = Pendulum(size: CGSize(width: 450, height: 700))
    
    
    var body: some View {
        SpriteView(scene: self.test)
            .frame(width: 450, height: 700)
            .ignoresSafeArea()
    }
}


struct PendulumView_Previews: PreviewProvider {
    static var previews: some View {
        PendulumView()
    }
}
