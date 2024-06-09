//
//  CalculateViewController.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 07.06.2024.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

final class CalculateViewController: UIViewController {

	// MARK: - Dependencies

	private var calculatorManager: CalculatorManager

	// MARK: - Private properties

	private lazy var calculateBackgroundImage: UIImageView = makeImageView()
	private lazy var mainStack: UIStackView = makeStackView()
	private lazy var titleLabel: UILabel = makeLabel()

	private lazy var heightStack: UIStackView = makeStackView()
	private lazy var heightLabel: UILabel = makeLabel()
	private lazy var meterLabel: UILabel = makeLabel()
	private lazy var heightSlider: UISlider = makeSlider()

	private lazy var weightStack: UIStackView = makeStackView()
	private lazy var weightLabel: UILabel = makeLabel()
	private lazy var kiloLabel: UILabel = makeLabel()
	private lazy var weightSlider: UISlider = makeSlider()

	private lazy var calculateButton: UIButton = makeButton()

	// MARK: - Initialization

	init(calculatorManager: CalculatorManager) {
		self.calculatorManager = calculatorManager
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}

	// MARK: - Private methods

	private func presentResult() {
		let bmi = calculatorManager.getBMI()
		let resultController = ResultViewController(bmi: bmi)

		present(resultController, animated: true)
	}
}

// MARK: - Actions

private extension CalculateViewController {

	func heightSliderChanged() -> UIAction {
		UIAction { [weak self] _ in
			guard let self else { return }

			let height = String(format: "%.2f", heightSlider.value)
			meterLabel.text = "\(height)\(Naming.Calculate.meter)"
		}
	}

	func weightSliderChanged() -> UIAction {
		UIAction { [weak self] _ in
			guard let self else { return }

			let weight = String(format: "%.0f", weightSlider.value)
			kiloLabel.text = "\(weight)\(Naming.Calculate.kilo)"
		}
	}

	func calculateTapped() -> UIAction {
		UIAction { [weak self] _ in
			guard let self else { return }

			let height = heightSlider.value
			let weight = weightSlider.value
			calculatorManager.calculate(height: Double(height), weight: Double(weight))

			presentResult()
		}
	}
}

// MARK: - Setup UI

private extension CalculateViewController {

	func setupUI() {
		addSubviews()
		addActions()

		setupMainStack()
		setupCalculateLabel()

		setupHeightStack()
		setupHeightLabel()
		setupMeterLabel()
		setupHeightSlider()

		setupWeightStack()
		setupWeightLabel()
		setupWeightSlider()
		setupKiloLabel()
	}

	func makeImageView() -> UIImageView {
		let element = UIImageView()

		element.image = Images.mainBackground
		element.contentMode = .scaleAspectFill
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeStackView() -> UIStackView {
		let element = UIStackView()

		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeLabel() -> UILabel {
		let element = UILabel()

		element.textColor = .darkGray
		element.numberOfLines = 0
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeSlider() -> UISlider {
		let element = UISlider()

		element.minimumTrackTintColor = Colors.darkPurple
		element.thumbTintColor = Colors.darkPurple
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeButton() -> UIButton {
		let element = UIButton()

		element.configuration = .filled()
		element.configuration?.title = Naming.Calculate.calculate
		element.configuration?.attributedTitle?.font = .preferredFont(forTextStyle: .title2)
		element.configuration?.baseBackgroundColor = Colors.purple
		element.configuration?.cornerStyle = .medium
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}
}

// MARK: - Setting UI

private extension CalculateViewController {

	func addSubviews() {
		view.addSubview(calculateBackgroundImage)
		view.addSubview(mainStack)

		mainStack.addArrangedSubview(titleLabel)
		mainStack.addArrangedSubview(heightStack)
		mainStack.addArrangedSubview(heightSlider)
		mainStack.addArrangedSubview(weightStack)
		mainStack.addArrangedSubview(weightSlider)
		mainStack.addArrangedSubview(calculateButton)

		heightStack.addArrangedSubview(heightLabel)
		heightStack.addArrangedSubview(meterLabel)

		weightStack.addArrangedSubview(weightLabel)
		weightStack.addArrangedSubview(kiloLabel)
	}

	func addActions() {
		heightSlider.addAction(heightSliderChanged(), for: .valueChanged)
		weightSlider.addAction(weightSliderChanged(), for: .valueChanged)
		calculateButton.addAction(calculateTapped(), for: .touchUpInside)
	}

	func setupCalculateLabel() {
		titleLabel.text = Naming.Calculate.title
		titleLabel.font = .preferredFont(forTextStyle: .extraLargeTitle)
	}

	func setupMainStack() {
		mainStack.axis = .vertical
		mainStack.spacing = Sizes.Spacing.medium
		mainStack.distribution = .fill
	}

	func setupHeightStack() {
		heightStack.distribution = .equalSpacing
	}

	func setupHeightLabel() {
		heightLabel.text = Naming.Calculate.height
		heightLabel.font = .preferredFont(forTextStyle: .body)
	}

	func setupMeterLabel() {
		let height = String(format: "%.2f", AppValues.Calculate.startHeight)
		meterLabel.text = "\(height)\(Naming.Calculate.meter)"
		meterLabel.font = .preferredFont(forTextStyle: .body)
	}

	func setupHeightSlider() {
		heightSlider.maximumValue = AppValues.Calculate.maxHeight
		heightSlider.value = AppValues.Calculate.startHeight
	}

	func setupWeightStack() {
		weightStack.distribution = .equalSpacing
	}

	func setupWeightLabel() {
		weightLabel.text = Naming.Calculate.weight
		weightLabel.font = .preferredFont(forTextStyle: .body)
	}

	func setupKiloLabel() {
		let weight = String(format: "%.0f", AppValues.Calculate.startWeight)
		kiloLabel.text = "\(weight)\(Naming.Calculate.kilo)"
		kiloLabel.font = .preferredFont(forTextStyle: .body)
	}

	func setupWeightSlider() {
		weightSlider.maximumValue = AppValues.Calculate.maxWeight
		weightSlider.value = AppValues.Calculate.startWeight
	}
}

// MARK: - Layout UI

private extension CalculateViewController {

	func layout() {
		NSLayoutConstraint.activate([
			calculateBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
			calculateBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			calculateBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			calculateBackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			mainStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
			mainStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

			heightStack.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Height.small),
			heightSlider.heightAnchor.constraint(equalToConstant: Sizes.Height.medium),

			weightStack.heightAnchor.constraint(greaterThanOrEqualToConstant: Sizes.Height.small),
			weightSlider.heightAnchor.constraint(equalToConstant: Sizes.Height.medium),

			calculateButton.heightAnchor.constraint(equalToConstant: Sizes.Height.medium)
		])
	}
}

#if DEBUG
struct CalculateViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			CalculateViewController(calculatorManager: CalculatorManager()).previw()
		}
	}
}
#endif
