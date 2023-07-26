import Foundation

final class Formatter {
	static let shared = Formatter()
	
	private init() {}
	
	func formatCreatedAt(_ dateString: String) -> String {
		let dateFormatterGet = DateFormatter()
		dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
		
		let dateFormatterPrint = DateFormatter()
		dateFormatterPrint.dateFormat = "dd.MM.yyyy"
		if let date = dateFormatterGet.date(from: dateString) {
			return dateFormatterPrint.string(from: date)
		} else {
			return dateString
		}
	}
}
