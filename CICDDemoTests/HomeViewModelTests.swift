import XCTest
import SwiftData
@testable import CICDDemo

@MainActor
final class HomeViewModelTests: XCTestCase {
    
    var container: ModelContainer!
    var context: ModelContext!
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        container = try ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        context = ModelContext(container)
        viewModel = HomeViewModel()
        viewModel.setModelContext(context)
    }

    override func tearDownWithError() throws {
        container = nil
        context = nil
        viewModel = nil
    }

    func testFetchItems_EmptyInitially() {
        XCTAssertTrue(viewModel.items.isEmpty)
    }

    func testAddItem_IncreasesItemCount() {
        viewModel.addItem()
        XCTAssertEqual(viewModel.items.count, 1)
    }

    func testDeleteItem_RemovesItemCorrectly() {
        viewModel.addItem()
        XCTAssertEqual(viewModel.items.count, 1)
        
        viewModel.deleteItems(at: IndexSet(integer: 0))
        XCTAssertEqual(viewModel.items.count, 0)
    }

    func testMultipleAddAndDelete() {
        viewModel.addItem()
        viewModel.addItem()
        XCTAssertEqual(viewModel.items.count, 2)
        
        viewModel.deleteItems(at: IndexSet([0]))
        XCTAssertEqual(viewModel.items.count, 1)
    }
}
