
<p><h1 align="left">Grid</h1></p>

## Overview

Grid is a powerful and easy way to layout your views in SwiftUI:
<a href="https://sm.ms/image/7lyuovL9QIE1Bhr" target="_blank"><img src="https://i.loli.net/2021/03/05/7lyuovL9QIE1Bhr.gif" ></a>

## Installation

#### CocoaPods

Grid is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FBTagGrid'
```

## Use

```swift

import  FBTagGrid

struct Item : Identifiable , FBGridItemSize {
    var id:String  = UUID().uuidString
    
    var text: String
    
    var size: CGSize {
        (text as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: 16)], context: nil).size
    }
}



struct ContentView: View {

    var items:[Item] = []
    
    var body: some View {
        FBTagGrid(items) { 
            Text($0.text).font(.system(size: 16))
        }
    }
}
```


## License

Grid is available under the MIT license. See the LICENSE file for more info.

