//
//  SettingViewModel.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import Combine
import SwiftUI

/**
 The main class for managing state in a `SettingStack`.
 */
public class SettingViewModel: ObservableObject {

    @Published public var searchText = ""
    @Published public var searchResult: SettingSearchResult?
    @Published public var highlightMatchingText = true
    @Published public var paths = [SettingPath]()

    public var regeneratePaths = PassthroughSubject<Void, Never>()
    public var cancellables = Set<AnyCancellable>()

    public init() {
        $searchText.sink { [weak self] searchText in
            guard let self else { return }
            self.processSearch(searchText: searchText)
        }
        .store(in: &cancellables)
    }
}

public extension SettingViewModel {
    func processSearch(searchText: String) {
        if searchText.isEmpty {
            searchResult = nil
            return
        }

        let paths = self.paths

        DispatchQueue.global(qos: .userInitiated).async {
            let searchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
            var matchingPaths = [SettingPath]()

            for path in paths {
                guard let lastItem = path.settings.last else { return }

                if let text = lastItem.text, text.localizedStandardContains(searchText) {
                    matchingPaths.append(path)
                }
            }

            var sections = [SettingSearchResult.Section]()

            for path in matchingPaths {
                /// should be the row in the main page
                guard let firstItem = path.settings.first else { continue }

                if let firstPage = firstItem as? SettingPage {
                    if let firstIndex = sections.firstIndex(where: { $0.header == firstPage.title }) {
                        sections[firstIndex].paths.append(path)
                    } else {
                        let section = SettingSearchResult.Section(
                            icon: firstPage.previewConfiguration.icon,
                            header: firstPage.title,
                            paths: [path]
                        )
                        sections.append(section)
                    }
                } else {
                    let path = SettingPath(settings: [firstItem])
                    let section = SettingSearchResult.Section(paths: [path])
                    sections.append(section)
                }
            }

            let searchResult = SettingSearchResult(sections: sections)

            DispatchQueue.main.async {
                self.searchResult = searchResult
            }
        }
    }
}
