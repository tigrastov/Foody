
import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
    
        HStack{
            
            Text(position.product.title).foregroundStyle(.foodyRed)
                .fontWeight(.bold)
            Spacer()
            
            Text("\(position.count)").foregroundStyle(.foodyRed)
            Spacer()
            
            Text("\(position.cost) din").foregroundStyle(.foodyRed)
                .frame(width: 80, alignment: .trailing)
            
        }
        .padding(.horizontal)
        .background(.white).cornerRadius(15)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID() .uuidString, product: Product(id: UUID().uuidString, title: "pelmeni", imageUrl: "pelmeni", price: 300, descript: "qwewqwe"), count: 1))
    }
}

