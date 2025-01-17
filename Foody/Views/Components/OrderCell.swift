
import SwiftUI

struct OrderCell: View {
    
  var order: Order = Order(userID: "", date: Date(), status: "Новый ")
   // let order: Order
    var body: some View {
        VStack{
            HStack{
                Text("\(order.date)").foregroundStyle(.foodyRed).font(.system(size: 8)).font(.body).padding()
                Text("\(order.cost )").bold().frame(width: 90).font(.system(size: 14)).foregroundStyle(Color.red)
                Text("\(order.status )").frame(width: 100).font(.system(size: 14)).foregroundStyle(.foodyRed)
            }
            .background(.white).cornerRadius(15)
                //.padding()
                
        }
        .frame(height: 40)
    }
}
struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
       OrderCell()
   }
}


