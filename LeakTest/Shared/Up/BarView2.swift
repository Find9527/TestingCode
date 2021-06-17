
import SwiftUI

struct BarView2:View {
    var dot1:Dot
    var dot2:Dot
    
    func makeBar(x1:CGFloat,x2:CGFloat) -> Path {
        var path=Path()
        path.addRoundedRect(in: CGRect(x: x1-150, y: 20, width: (x2-x1), height: 20), cornerSize: CGSize(width: 10, height: 10))
        return path
    }
    
    var body: some View {
        makeBar(x1: dot1.nodepointX, x2: dot2.nodepointX)
    }
}



struct BarView2_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            BarView2(dot1: Dot(id: UUID(), nodepointX: 200), dot2: Dot(id: UUID(), nodepointX: 350))
        }
    }
}

