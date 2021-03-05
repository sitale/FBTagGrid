//
//  OnlyText.swift
//  FBTagGrid (iOS)
//
//  Created by JYCK_iOS on 2021/3/5Friday.
//

import SwiftUI

struct  OnlyText : View {
    
    @StateObject var loader = TestModel.shared
    
    var body: some View {
        FBTagGrid(loader.items) { item in
            Text(item.text)
                .font(.system(size: 16))
                .border(Color.white, width: 1.0)
        }
    }
    
}


struct OnlyText_Previews: PreviewProvider {
    static var previews: some View {
        OnlyText()
    }
}
