//
//  ViewController.swift
//  PullToRefreshExample_TableViewController
//
//  Created by Andrew Bancroft on 3/16/15.
//  Copyright (c) 2015 Andrew Bancroft. All rights reserved.
//

import UIKit

struct Movie {
	let title: String
	let genre: String
}

class ViewController: UITableViewController {

	var movies = [
		Movie(title: "Lion King", genre: "Animation"),
		Movie(title: "Star Wars", genre: "Sci-fi")
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.refreshControl?.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
	}
	
	func handleRefresh(refreshControl: UIRefreshControl) {
		// Do some reloading of data and update the table view's data source
		// Fetch more objects from a web service, for example...
		
		// Simply adding an object to the data source for this example
		let newMovie = Movie(title: "Serenity", genre: "Sci-fi")
		movies.append(newMovie)
		
		movies.sort() { $0.title < $1.title }
		
		self.tableView.reloadData()
		refreshControl.endRefreshing()
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
		
		cell.textLabel?.text = movies[indexPath.row].title
		cell.detailTextLabel?.text = movies[indexPath.row].genre
		
		return cell
	}
}