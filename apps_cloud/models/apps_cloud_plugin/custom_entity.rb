class AppsCloudPlugin::CustomEntity < ApplicationRecord
  self.table_name = "apps_cloud_plugin_custom_entities"
  belongs_to :environment
  attr_accessible :entity_type, :environment

  validates :entity_type, presence: true, uniqueness: {scope: :environment}
  validates :environment, presence: true
 include Customizable
  acts_as_customizable
end
