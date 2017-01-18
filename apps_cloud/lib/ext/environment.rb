require_dependency "environment"

class Environment
  has_many :custom_entities, class_name: "AppsCloudPlugin::CustomEntity"
end
