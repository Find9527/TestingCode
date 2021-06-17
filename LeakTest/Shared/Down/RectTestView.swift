
import SwiftUI

struct RectTestView: View {
    @State var width:CGFloat = 100
    @Binding var tabCount:Int
    
    var body: some View {
            VStack {
                Rectangle()
                    .frame(width: width, height: 40, alignment: .center)
                Rectangle()
                    .frame(width: 1000, height: 100, alignment: .center)
            }
            .frame(width:700, height: 600,alignment: .center)

    }
}

struct RectTestView_Previews: PreviewProvider {
    @State static var tabCount:Int = 0
    static var previews: some View {
        RectTestView(tabCount: $tabCount)
           
    }
}
