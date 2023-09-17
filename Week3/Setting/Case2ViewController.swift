//
//  Case2ViewController.swift
//  Week3
//
//  Created by 서동운 on 7/27/23.
//

import UIKit

class Case2ViewController: UIViewController {
    let viewModel = Case2ViewModel()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        dataSource = makeDiffableDataSource()
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.first, .second, .third])
        snapshot.appendItems(viewModel.settings[Section.first.rawValue].items, toSection: .first)
        snapshot.appendItems(viewModel.settings[Section.second.rawValue].items, toSection: .second)
        snapshot.appendItems(viewModel.settings[Section.third.rawValue].items, toSection: .third)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.headerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}

extension Case2ViewController {
    
    enum Section: Int, Hashable {
        case first = 0
        case second
        case third
    }
    
    func makeDiffableDataSource() -> UICollectionViewDiffableDataSource<Section, String> {
        
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) { [weak self]
            (supplementaryView, string, indexPath) in

            var groupHeaderConfiguration = supplementaryView.defaultContentConfiguration()
            groupHeaderConfiguration.text = self?.viewModel.settings[indexPath.section].korean
            groupHeaderConfiguration.textProperties.font = .systemFont(ofSize: 15)
            supplementaryView.contentConfiguration = groupHeaderConfiguration
        }
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { [weak self] (cell, indexPath, item) in
            var configuration = cell.defaultContentConfiguration()
//            content.text = Case2[section][indexPath.row]
            configuration.text = self?.viewModel.settings[indexPath.section].items[indexPath.item]
            configuration.textProperties.font = .systemFont(ofSize: 13)
            cell.contentConfiguration = configuration
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            return cell
        }
        
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            if elementKind == UICollectionView.elementKindSectionHeader {
                return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
            } else {
                return nil
            }
        }
        
        return dataSource
    }
}
