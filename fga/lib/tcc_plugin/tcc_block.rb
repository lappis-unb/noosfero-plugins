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
    engineering_names = ["Eletrônica" , "Software" , "Automotiva", "Aeroespacial", "Energia"]

    engineering_names.each do |engineering_name|
      folder = WorkAssignmentPlugin::WorkAssignment.new
      folder.name = settings[:folder_name]
      folder.profile_id = Profile.find_by(name: "TCC").id
      folder.parent_id = Article.find_by(name: engineering_name, profile_id: folder.profile_id).id
      folder.save
    end
  end

end
