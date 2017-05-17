class TccBlock < Block

  after_save :create_folder
  settings_items :folder_name, :type => :string, :default => 'all'

  attr_accessible :folder_name

  def self.description
    _('TCC')
  end

  def help
    _('This block displays a link to TCC\'s help page.')
  end

  def view_title
    _('Submit TCC')
  end

  def create_folder
    puts "*" * 10000
    puts settings[:folder_name]

    #folder = Article.find_by(:identifier, self.folder_name)

  end

end
