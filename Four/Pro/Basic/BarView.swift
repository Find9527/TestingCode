
import SwiftUI

struct BarView:View {
    @EnvironmentObject var ges:GestureClass
    var dot1:Dot
    var dot2:Dot
    
    func makeBar(x1:CGFloat,x2:CGFloat) -> Path {
        var path=Path()
        path.addRoundedRect(in: CGRect(x: x1, y: 20, width: (x2-x1)*ges.gesResult(), height: 20), cornerSize: CGSize(width: 10, height: 10))
        return path
    }
    
    var body: some View {
        makeBar(x1: dot1.nodepointX, x2: dot2.nodepointX)
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            BarView(dot1: Dot(id: UUID(), nodepointX: 150), dot2: Dot(id: UUID(), nodepointX: 350))
                .environmentObject(GestureClass())
        }
    }
}







//    func makeBar(x:CGFloat, width:CGFloat) -> Path {
//        var path=Path()
//        path.addRoundedRect(in: CGRect(x: x-100, y: 20, width: width, height: 20), cornerSize: CGSize(width: 10, height: 10))
//        return path
//    }
//
//    var body: some View {
//        makeBar(x: dot.nodepointX, width:width)
//            .onChange(of: ges.current, perform: { value in
//                width = ges.gesResult()*100
//            })
//    }

//struct ReadIndex {
//    var myindex:IndexOfList
//    func readindex() -> Int {
//        var oneint:Int
//        oneint=myindex.indexstart
//        return oneint
//    }
//}
//需要解析出结构体中的数组
