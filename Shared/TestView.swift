//
//  TestView.swift
//  FBTagGrid (iOS)
//
//  Created by JYCK_iOS on 2021/3/5Friday.
//

import SwiftUI

extension String {
    
    func size(_ font: UIFont = UIFont.systemFont(ofSize: 16)) ->  CGSize {
        (self as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [.font:  font], context: nil).size
    }
    
}


struct FBRow : Identifiable , FBGridItemSize {
    var id:String  = UUID().uuidString
    
    var text: String
    

    var size: CGSize {
        var size = text.size()
        size.width += 105
        return size
    }
    
    init(text: String) {
        self.text = text
    }
}


//MARK: - itemView
struct FBRowItemView  :View {
    
    let row: FBRow
    
    var body: some View {
        HStack(spacing: 0 ) {
            
            Group {
                Image(systemName: "number.circle")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
            }
            .padding(.horizontal, 10)
            
            Group {
                Text(row.text)
                    .lineLimit(1)
                    .font(.system(size: 16))
            }
            .padding(.horizontal, 12)
            
            Color.white.frame(width: 1)
            
            Group {
                Image(systemName: "delete.left")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
            }
            .padding(.horizontal, 10)
        }
        .padding(.all, 0)
        .frame(height: 44)
        .capsuleCorners(radius: 22, width: 1, color: .black)
    }
    
    
}



//MARK: - renderView
struct TestView : View {
    
    @StateObject var loader = TestModel.shared
    
    
    var body: some View {
        FBTagGrid(loader.items) { item in
            FBRowItemView(row: item)
        }
        
    }
    
    

}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

