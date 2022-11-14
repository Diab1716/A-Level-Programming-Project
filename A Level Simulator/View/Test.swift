//
//  Test.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 09/11/2022.
//

import SwiftUI
import SpriteKit

struct Test: View {
    var test = GravitationalField(size: CGSize(width: 340, height: 340))
    
    
    var body: some View {
        SpriteView(scene: self.test)
            .frame(width: 340, height: 340)
            .ignoresSafeArea()
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
