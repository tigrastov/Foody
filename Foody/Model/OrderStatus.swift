
import Foundation
import FirebaseStorage

enum OrderStatus: String, CaseIterable{
    case new = "New"
    case cooking = "In progress"
    case delivery = "Delivery"
    case completed = "Completed"
    case cancelled = "Canceled"
}

