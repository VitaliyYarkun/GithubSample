import UIKit

final class GitHubRepositoryCell: UITableViewCell, ReusableView {
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 8
            containerView.layer.masksToBounds = true
        }
    }

    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageContainerView: UIView!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starLabel: UILabel!

    func configure(with repository: GitHub.Repository) {
        repositoryNameLabel.text = repository.fullName

        if let description = repository.description {
            descriptionLabel.isHidden = false
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
            descriptionLabel.text = nil
        }

        if let language = repository.language {
            languageContainerView.isHidden = false
            languageLabel.text = language
        } else {
            languageContainerView.isHidden = true
            languageLabel.text = nil
        }

        starLabel.text = "★ \(repository.stargazersCount)"
    }
}
