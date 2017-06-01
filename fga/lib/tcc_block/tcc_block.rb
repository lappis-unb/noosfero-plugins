class TccBlock < Block

  after_save :create_folder

  settings_items :submition_phase, :type => :string, :default => 'all'
  settings_items :submition_year, :type => :integer, :default => 1900
  settings_items :submition_semester, :type => :integer, :default => 0

  attr_accessible :submition_phase, :submition_year, :submition_semester

  def self.description
    _('TCC')
  end

  def help
    _('This block displays a link to TCC\'s help page.')
  end

  def view_title
    _('Submit TCC')
  end

  def concatenate_folder_name_string(submition_phase, submition_year, submition_semester)
    "#{submition_phase}" << " TCC " << "#{submition_year}" << "." << "#{submition_semester}"
  end

  def create_folder
    engineering_names = ["Eletrônica" , "Software" , "Automotiva", "Aeroespacial", "Energia"]
    folder_name = concatenate_folder_name_string(settings[:submition_phase], settings[:submition_year], settings[:submition_semester])

    if !Article.find_by(name: folder_name)
      engineering_names.each do |engineering_name|
        folder = WorkAssignmentPlugin::WorkAssignment.new
        folder.name = folder_name
        folder.profile = Profile.find_by(name: "TCC")
        folder.parent_id = Article.find_by(name: engineering_name, profile: folder.profile, parent_id: nil).id
        folder.save
      end
    end
  end

end
