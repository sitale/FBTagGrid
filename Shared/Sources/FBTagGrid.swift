//
//  FBTagGrid.swift
//  FBTagGrid (iOS)
//
//  Created by JYCK_iOS on 2021/3/5Friday.
//

import SwiftUI

public struct FBTagGrid : View  {
    
    let items: [FBGridItem]
    var spacing: CGFloat
    
    public init<T, Item>( _ data: [T], @ViewBuilder item: @escaping (T) -> Item, spacing: CGFloat = 34) where T : Identifiable, Item : View , T : FBGridItemSize {
        self.items = data.map { FBGridItem(view: AnyView(item($0)), id: AnyHashable($0.id), size: $0.size )}
        self.spacing = spacing
    }
    
    
    
    public var body : some View {
        GeometryReader { reader in
            ScrollView(.vertical, showsIndicators: false) {
                FBGrid(spacing: spacing, items: items, size: reader.size)
            }
            .frame(width: reader.size.width, height: reader.size.height)
        }

    }
}

//MARK: - FBGrid
public struct FBGrid : View {
    
    let spacing: CGFloat
    let items: [FBGridItem]
    let size: CGSize
    var maxY:CGFloat = 0
    
    public init(spacing: CGFloat, items: [FBGridItem], size: CGSize) {
        self.spacing = spacing
        self.items = items
        self.size = size
        self.calculateItemOrigin()
    }
    
    mutating func calculateItemOrigin() {
        self.items.enumerated().forEach { obj in
            if let last = items[safe: obj.offset - 1] {
                let x = last.origin.x + last.size.width
                if x + obj.element.size.width > size.width - spacing  {
                    obj.element.origin = CGPoint(x: spacing, y: last.origin.y + last.size.height + spacing)
                }  else {
                    obj.element.origin = CGPoint(x: x + spacing , y: last.origin.y)
                }
            } else {
                obj.element.origin = CGPoint(x: spacing, y:  spacing)
            }
        }
        
        if let last = self.items.last {
            maxY = last.origin.y + last.size.height + spacing
        }
        maxY = max(maxY, size.height)
        print("Well done!!!")
    }
    
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(items) { item in
                item.view
                    .frame(width: item.size.width, height: item.size.height)
                    .offset(x: item.origin.x, y: item.origin.y)
            }
        }
        .frame(width: size.width, height: maxY, alignment: .topLeading)
    }
}


//MARK: - FBGridItem
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public class FBGridItem: Identifiable {
    public let view: AnyView
    public let id: AnyHashable
    
    var size: CGSize = .zero
    var origin:CGPoint = .zero

    public init(view: AnyView, id: AnyHashable, size: CGSize? = nil) {
        self.view = view
        self.id  = id
        if let size = size {
            self.size = size
        }
    }
}

//MARK: - FBGridItemSize
public protocol FBGridItemSize {
    var size: CGSize {get}
}



//MARK: - etxetnsion
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


public extension View {
    
    func capsuleCorners(radius: CGFloat, width: CGFloat = 0.5, color: Color = .secondary ) -> some View {
        overlay(
            RoundedRectangle(cornerRadius: radius).stroke(color, lineWidth: width)
        )
    }
    
    
}
