
import SwiftUI

//--------------------Model----------------------------------------
struct Dot:Identifiable, Hashable, Codable {
    var id:UUID = UUID()
    var nodepointX:CGFloat=0
}

class ModelData:ObservableObject {
//    @Published var list:[Dot]=[Dot(id: UUID(), nodepointX: 50),Dot(id: UUID(), nodepointX: 150)]
    
    @Published var list:[Dot]=[]
    @Published var list2:[Dot]=[]
    
    func addBar(para:inout [Dot], geo:GeometryProxy){
        para.append(Dot(id: UUID(), nodepointX: geo.frame(in: .named("coordinateModel")).midX))
        
        func onSort(s1: Dot , s2: Dot ) -> Bool {
             return s1.nodepointX < s2.nodepointX
        }
        para.sort(by: onSort)
    }
}

//----------------------Index----------------------------------------

struct IndexOfList:Identifiable, Hashable, Codable {
    var id:UUID = UUID()
    var indexstart:Int = 0
    var indexend:Int = 0
}

class ModelIndex:ObservableObject {

    @Published var list:[IndexOfList]
    
    init() {
        self.list = []
    }
    
    init(data:[IndexOfList]) {
        self.list = []
        for item in data {
            self.list.append(IndexOfList(id: item.id, indexstart: item.indexstart, indexend: item.indexend))
        }
    }
    
    func addIndex(start:Int, end:Int) {
        self.list.append(IndexOfList(id: UUID(), indexstart: start, indexend: end))
        self.dataSave()
    }
    
    func dataSave() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.list) {
            UserDefaults.standard.set(encoded, forKey: "XSave")
        }
    }
   
}

//-----------------------------------------------------------------

class YearNumbers: ObservableObject {
    @Published var start:Int = 0
}

class ProjectWdith: ObservableObject {
    @Published var width:CGFloat = 100
}

class OpenTime: ObservableObject {
    @Published var count:Int = 1000
}



func initIndex() -> [IndexOfList] {
    var output: [IndexOfList] = []
    if let savedPerson = UserDefaults.standard.object(forKey: "XSave") as? Data {
        let decoder = JSONDecoder()
        if let loadedPerson = try? decoder.decode([IndexOfList].self, from: savedPerson) {
            for item in loadedPerson {
                output.append(IndexOfList(id: item.id, indexstart: item.indexstart, indexend: item.indexend))
            }
        }
    }
    return output
}


func foreColor(item:Int) -> Color{
    var color:Color = .gray
    if item < 20{
        color = .red
    }else if item >= 80 {
        color = .yellow
    }else{
        color = .green
    }
    return color
}





























struct ContentView3: View {
    var body: some View {
        Text("Model Class")
            .font(.largeTitle)
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
            .frame(width:500, height: 400)
    }
}
