//
//  ContentView.swift
//  Shared
//
//  Created by JYCK_iOS on 2021/3/5Friday.
//

import SwiftUI





class TestModel : ObservableObject {
    static private(set) var shared = TestModel()
    
    @Published var items:[FBRow] = []
    
    
    let list = "/Users/fb/Library/Developer/Xcode/DerivedData/wx-edveupwronmnriekvkokkrcinvff/Build/Products/Debug/Editor.app".components(separatedBy: "/")
    
    init() {
        items = (0..<25).map({ _ in  FBRow(text:(list.randomElement() ?? "") + (list.randomElement() ?? "") + (list.randomElement() ?? ""))  })
    }
    
    
    func add() {
        items.append(FBRow(text:(list.randomElement() ?? "") + (list.randomElement() ?? "") + (list.randomElement() ?? "")))
    }
    
    func remove() {
        if let element = items.randomElement() , let idx = items.firstIndex(where: {  $0.id == element.id }) {
            items.remove(at: idx )
        }
    }
}











struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
