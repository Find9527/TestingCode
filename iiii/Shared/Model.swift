
import SwiftUI


struct Dot:Identifiable,Hashable {
    var id:UUID = UUID()
    var nodepointX:CGFloat=0
    var nodepointY:CGFloat=0
}
class ModelData:ObservableObject {
    @Published var list:[Dot]=[Dot(id: UUID(), nodepointX: 100, nodepointY: 30),Dot(id: UUID(), nodepointX: 150, nodepointY: 80)]
    func addBar(item:Dot){
        self.list.append(Dot(id: UUID(), nodepointX:item.nodepointX, nodepointY: item.nodepointY))
    }
}

struct IndexOfList:Identifiable,Hashable {
    var id:UUID = UUID()
    var indexint:Int = 1
}
class ModelIndex:ObservableObject {
//    @Published var list:[IndexOfList]=[IndexOfList(id: UUID(), indexint: 0),IndexOfList(id: UUID(), indexint: 1)]
    @Published var list:[IndexOfList]=[]
    func addIndex(item:IndexOfList){
        self.list.append(item)
    }
}
