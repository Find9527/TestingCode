//
//  GameVC.swift
//  UIPageControl
//
//  Created by Orange on 2021/6/10.
//

import UIKit

class GameVC: UITableViewController {

    var games: [Game] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            games = Game.getData()
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return games.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
            cell.game = games[indexPath.row]
            return cell
        }

}
