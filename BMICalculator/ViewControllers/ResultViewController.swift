//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 08.06.2024.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

final class ResultViewController: UIViewController {
	
	// MARK: - Outlets
	
	// MARK: - Public properties
	
	// MARK: - Dependencies

	// MARK: - Private properties

	private lazy var backgroundImage: UIImageView = makeImageView()
	private lazy var mainStack: UIStackView = makeStackView()

	private lazy var titleLabel: UILabel = makeLabel()
	private lazy var bmiValueLabel: UILabel = makeLabel()
	private lazy var adviceLabel: UILabel = makeLabel()

	private lazy var recalculateButton: UIButton = makeButton()

	// MARK: - Initialization

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}

	// MARK: - Public methods

	// MARK: - Private methods
}

// MARK: - Actions

private extension ResultViewController {

	func recalculateTapped() -> UIAction {
		UIAction { [weak self] action in
			guard let sender = action.sender as? UIButton else { return }

			print(sender.configuration?.title ?? "no title")
			self?.dismiss(animated: true)
		}
	}
}

// MARK: - Setup UI

private extension ResultViewController {

	func setupUI() {
		view.backgroundColor = .systemCyan
		bmiValueLabel.text = "0.0"
		adviceLabel.text = "Advice"

		addSubviews()
		addActions()

		setupTitleLabel()
		setupValueLabel()
		setupAdviceLabel()
	}

	func makeImageView() -> UIImageView {
		let element = UIImageView()

		element.image = Images.resultBackground
		element.contentMode = .scaleAspectFill
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeStackView() -> UIStackView {
		let element = UIStackView()

		element.axis = .vertical
		element.spacing = Sizes.Spacing.medium
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeLabel() -> UILabel {
		let element = UILabel()

		element.textAlignment = .center
		element.textColor = .white
		element.numberOfLines = 0
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeButton() -> UIButton {
		let element = UIButton()

		element.configuration = .filled()
		element.configuration?.baseBackgroundColor = .white
		element.configuration?.cornerStyle = .medium
		element.configuration?.title = Naming.Result.recalculate
		element.configuration?.attributedTitle?.font = .preferredFont(forTextStyle: .title2)
		element.configuration?.baseForegroundColor = Colors.purple
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}
}

// MARK: - Setting UI

private extension ResultViewController {

	func addSubviews() {
		view.addSubview(backgroundImage)
		view.addSubview(mainStack)
		view.addSubview(recalculateButton)

		mainStack.addArrangedSubview(titleLabel)
		mainStack.addArrangedSubview(bmiValueLabel)
		mainStack.addArrangedSubview(adviceLabel)
	}

	func addActions() {
		recalculateButton.addAction(recalculateTapped(), for: .touchUpInside)
	}

	func setupTitleLabel() {
		titleLabel.text = Naming.Result.title
		titleLabel.font = .preferredFont(forTextStyle: .extraLargeTitle)
	}

	func setupValueLabel() {
		bmiValueLabel.font = .systemFont(ofSize: 80, weight: .bold)
	}

	func setupAdviceLabel() {
		adviceLabel.font = .preferredFont(forTextStyle: .title3)
	}
}

// MARK: - Layout UI

private extension ResultViewController {

	func layout() {
		NSLayoutConstraint.activate([
			backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			recalculateButton.heightAnchor.constraint(equalToConstant: Sizes.Height.medium),
			recalculateButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
			recalculateButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}

#if DEBUG
struct ResultViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			ResultViewController().previw()
		}
	}
}
#endif
