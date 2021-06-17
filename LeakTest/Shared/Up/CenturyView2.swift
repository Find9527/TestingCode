
import SwiftUI

struct CenturyView2: View {
    @Binding var width:CGFloat
    
    var height:CGFloat=20
    
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<10) { item in
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .continuous)
                    .frame(width: 10*width, height: height, alignment: .leading)
                    .overlay(Text("\(item)").foregroundColor(.white))
            }
        }
        .frame(height:40)
       
    }
}

struct CenturyView2_Previews: PreviewProvider {
    @State static var width:CGFloat=100
    static var previews: some View {
        CenturyView2(width: $width)
            .frame(width: 600, height: 600, alignment: .center)
    }
}
