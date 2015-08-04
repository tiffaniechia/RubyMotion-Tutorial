class AlphabetController < UIViewController

  def viewDidLoad
    super

    self.title = 'Alphabet'

    # view.boynds = newview to size itself to fill view
    @table = UITableView.alloc.initWithFrame(self.view.bounds)

    self.view.addSubview @table


    # datasource for supplying information
    @table.dataSource = self
    # delegate to manage user behaviour and look-and-feel
    @table.delegate = self

    @data = ('A'..'Z').to_a
  end
  
  # data source must implement this method
  # NSIndexPath is an object that has a sextion and a row property

  # UITableViewCell is the UIView subclass that actually gets displayed in our table
  # the default implementation comes with useful fields such as textlabel adn an imageview
  # you can subclass uitableciewcell to add a custom look and behaviour

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
  #   return the uitableviewcell for the row
  #   WHAT IS THIS REUSEIDENTIFIER?
  #   UITableView does its reuse magic by giving an identifier to each type of cell used in the table
  #   when you grab a cell for reuse you are actualy grabbing them from a pool of cell with the same identitfier
  #   so if there is a unique identifier for every row, none of the cells would get reused because there would only be one cell per pool

    @reuseIdentifier ||= 'CELL_IDENTIFIER'


    # dequeuereusablecellwithidentifier to grab an uitableviewcell with that identifier
    # if it returns nil, we run the begin/end block
    # this block creats a new uitableviewcell with a style and the reuseidentifier for this cell
    # at the end of the method we should return our cell
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
    end

    # put data in cell
    cell.textLabel.text = @data[indexPath.row]

    cell
  end

  # data source must implement this method
  def tableView(tableView, numberOfRowsInSection: section)
  #   return the number of rows
    @data.count
  end

#   no required methods for delegate but just to try out
  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{@data[indexPath.row]} tapped!"
    alert.addButtonWithTitle 'OK'
    alert.show
  end
end