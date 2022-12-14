

import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Profile2Cell2: UITableViewCell {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var imageVerified: UIImageView!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonMore: UIButton!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var layoutConstraintCollectionViewHeight: NSLayoutConstraint!
	@IBOutlet var labelLikes: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var buttonlike: UIButton!
	@IBOutlet var buttonComment: UIButton!
	@IBOutlet var buttonShare: UIButton!

	var imagesCount = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonlike.layer.borderWidth = 1
		buttonlike.layer.borderColor = AppColor.Border.cgColor

		buttonComment.layer.borderWidth = 1
		buttonComment.layer.borderColor = AppColor.Border.cgColor

		buttonShare.layer.borderWidth = 1
		buttonShare.layer.borderColor = AppColor.Border.cgColor

		layoutConstraintCollectionViewHeight.constant = collectionView.frame.size.width*0.6

		collectionView.register(UINib(nibName: "Profile2Cell3", bundle: Bundle.main), forCellWithReuseIdentifier: "Profile2Cell3")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: Any]) {

		guard let name = data["name"] as? String else { return }
		guard let time = data["time"] as? String else { return }
		guard let images = data["images"] as? Int else { return }
		guard let likes = data["likes"] as? String else { return }
		guard let comments = data["comments"] as? String else { return }

		imageViewProfile.sample("Social", "Portraits", 15)
		labelName.text = name
		labelTime.text = time
		imagesCount = images
		labelLikes.text = likes
		labelComments.text = comments
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2Cell2: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile2Cell3", for: indexPath) as! Profile2Cell3
		cell.bindData(index: indexPath.row, data: "6")
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2Cell2: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2Cell2: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-10)
		let height = (collectionView.frame.size.height)

		if (indexPath.row == 0) { return CGSize(width: (width/2), height: height) }

		return CGSize(width: (width/2), height: (height-10)/2)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}
