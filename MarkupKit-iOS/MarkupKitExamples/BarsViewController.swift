//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import MarkupKit

class BarsViewController: UIViewController, UITabBarDelegate {
    @IBOutlet var tabLabel: UILabel!
    @IBOutlet var tabBar: UITabBar!
    
    override func loadView() {
        view = LMViewBuilder.view(withName:"BarsViewController", owner: self, root: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Bars"

        edgesForExtendedLayout = UIRectEdge()

        tabBar.delegate = self
    }

    #if os(iOS)
    func compose() {
        performAction(name: "compose")
    }

    func reply() {
        performAction(name: "reply")
    }

    func organize() {
        performAction(name: "organize")
    }

    func search() {
        performAction(name: "search")
    }

    func trash() {
        performAction(name: "trash")
    }

    func performAction(name: String) {
        let alertController = UIAlertController(title: "Action Performed", message: String(format: "You selected \"%@\".", name), preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))

        present(alertController, animated: true, completion: nil)
    }
    #endif

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabLabel.text = String(format: "You selected the \"%@\" tab.", item.name)
    }
}
