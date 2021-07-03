
import SwiftUI


class WindowWidth: ObservableObject {
    @Published var windowCenterX:CGFloat = 0
}

class AnchorModel: ObservableObject {
    @Published var IDappear:Int
    
    init() {
        self.IDappear = 55
    }
    
    @Published var ID:Int=0
    @Published var length:CGFloat=0
}


//-----------------------------------------------------------------

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}




























//-----------------------------------------------------------------
struct OffsetModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OffsetModel_Previews: PreviewProvider {
    static var previews: some View {
        OffsetModel()
    }
}
