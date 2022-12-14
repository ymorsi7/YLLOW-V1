
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Feed2Cell4: UITableViewCell {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelWithName: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var imageLocation: UIImageView!
	@IBOutlet var labelLocation: UILabel!
	@IBOutlet var buttonMore: UIButton!
	@IBOutlet var imageContent: UIImageView!
	@IBOutlet var buttonlike: UIButton!
	@IBOutlet var buttonComment: UIButton!
	@IBOutlet var buttonShare: UIButton!
	@IBOutlet var labelLikes: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var labelShare: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let withName = data["withName"] else { return }
		guard let time = data["time"] else { return }
		guard let location = data["location"] else { return }
		guard let likes = data["likes"] else { return }
		guard let comments = data["comments"] else { return }
		guard let shares = data["shares"] else { return }

		imageViewProfile.sample("Social", "Portraits", index)
		labelName.text = name
		labelWithName.text = withName
		labelTime.text = time
		labelLocation.text = location
		imageContent.sample("Social", "Friendships", index)
		labelLikes.text = likes
		labelComments.text = comments
		labelShare.text = shares
	}
}
