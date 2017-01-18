class CreateCustomEntity < ActiveRecord::Migration
  def up
    create_table :apps_cloud_plugin_custom_entities do |t|
      t.column :entity_type, :string
      t.column :environment_id, :integer
    end
    add_foreign_key :apps_cloud_plugin_custom_entities, :environments,
      on_delete: :cascade
  end

  def down
    remove_foreign_key :apps_cloud_plugin_custom_entities, :environments
    drop_table :apps_cloud_plugin_custom_entities
  end
end
