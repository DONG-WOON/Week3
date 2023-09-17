//
//  Case1ViewController.swift
//  Week3
//
//  Created by 서동운 on 9/16/23.
//

import UIKit
import SnapKit

class Case1ViewController: UIViewController {
    
    let viewModel = Case1ViewModel()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    var dataSource: UICollectionViewDiffableDataSource<Section, Case1>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        dataSource = makeDiffableDataSource()
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Case1>()
        snapshot.appendSections([.first, .second])
        snapshot.appendItems(viewModel.modeSetting, toSection: .first)
        snapshot.appendItems(viewModel.shareSetting, toSection: .second)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.headerMode = .supplementary
        configuration.footerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}

extension Case1ViewController {
    
    enum Section: Int, Hashable {
        case first = 0
        case second
    }
    
    func makeDiffableDataSource() -> UICollectionViewDiffableDataSource<Section ,Case1> {
        
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) {
            (supplementaryView, string, indexPath) in
            if indexPath.section == 0 {
                var groupHeaderConfiguration = supplementaryView.defaultContentConfiguration()
                groupHeaderConfiguration.text = ModeSetting.headerTitle
                groupHeaderConfiguration.textProperties.font = .systemFont(ofSize: 12)
                supplementaryView.contentConfiguration = groupHeaderConfiguration
            }
        }
        
        let footerRegistration = UICollectionView.SupplementaryRegistration
        <UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionFooter) {
            (supplementaryView, string, indexPath) in
            var groupedFooterConfiguration = supplementaryView.defaultContentConfiguration()
            groupedFooterConfiguration.textProperties.font = .systemFont(ofSize: 13)
            
            if indexPath.section == 0 {
                groupedFooterConfiguration.text = ModeSetting.footerTitle
            } else {
                groupedFooterConfiguration.text = ShareSetting.footerTitle
            }
            
            supplementaryView.contentConfiguration = groupedFooterConfiguration
        }
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Case1> { [weak self] (cell, indexPath, case1) in
            self?.configure(cell, indexPath: indexPath, item: case1)
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Section, Case1>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            return cell
        }
        
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            
            if elementKind == UICollectionView.elementKindSectionHeader {
                return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
            } else {
                return collectionView.dequeueConfiguredReusableSupplementary(using: footerRegistration, for: indexPath)
            }
        }
        
        return dataSource
    }
    
    func configure(_ cell: UICollectionViewListCell, indexPath: IndexPath, item: Case1) {
        
        var valueCellConfiguration = UIListContentConfiguration.valueCell()
        valueCellConfiguration.text = item.setting.title
        valueCellConfiguration.secondaryText = item.setting.subTitle
        valueCellConfiguration.textProperties.font = .systemFont(ofSize: 12)
        valueCellConfiguration.secondaryTextProperties.font = .systemFont(ofSize: 12)
        valueCellConfiguration.image = UIImage(systemName: item.setting.imageName ?? "")
        valueCellConfiguration.imageProperties.tintColor = .getColor(item.setting.imageColor ?? "")
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .small)
        valueCellConfiguration.imageProperties.preferredSymbolConfiguration = symbolConfiguration
        
        switch indexPath.section {
        case 0:
            if indexPath.item == 2 {
                valueCellConfiguration.prefersSideBySideTextAndSecondaryText = false
            } else {
                valueCellConfiguration.prefersSideBySideTextAndSecondaryText = true
            }
            cell.accessories = [.disclosureIndicator()]
        case 1:
            guard let shareSetting = item.setting as? ShareSetting else { return }
            let `switch` = UISwitch()
            `switch`.isOn = shareSetting.isShared
            `switch`.addTarget(self, action: #selector(shareSwitchToggle), for: .valueChanged)
            cell.accessories = [.disclosureIndicator(), .customView(configuration: .init(customView: `switch`, placement: .trailing()))]
        default:
            return
        }
        cell.contentConfiguration = valueCellConfiguration
    }
    
    @objc func shareSwitchToggle(_ sender: UISwitch) {
        viewModel.shareSetting = [Case1(ShareSetting.share(sender.isOn))]
    }
}
