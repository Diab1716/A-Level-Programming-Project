//
//  PendulumView.swift
//  A Level Simulator
//
//  Created by Diab, Ahmed (HWTA) on 23/11/2022.
//

import SwiftUI
import SpriteKit

struct PendulumView: View {
var fieldGenerator = FieldGenerator(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
    
    
    var body: some View {
        VStack{
        SpriteView(scene: self.fieldGenerator)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            .ignoresSafeArea()
        

        
    }
}


struct PendulumView_Previews: PreviewProvider {
    static var previews: some View {
        PendulumView()
    }
}
}
