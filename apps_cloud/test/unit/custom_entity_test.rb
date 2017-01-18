require "test_helper"

class CustomEntityTest < ActiveSupport::TestCase

  should "not create a custom entity without environment" do
    entity = AppsCloudPlugin::CustomEntity.new entity_type: "dylan"
    assert_not entity.save
  end

  should "not create a entity without a type" do
    entity = AppsCloudPlugin::CustomEntity.new environment: Environment.default
    assert_not entity.save
  end

  should "not create two entitites with the same type" do
    AppsCloudPlugin::CustomEntity.create entity_type: "dylan", environment: Environment.default
    entity = AppsCloudPlugin::CustomEntity.new entity_type: "dylan", environment: Environment.default
    assert_not entity.save
  end

  should "create two entities with the same type in different environments" do
    env = Environment.create name: "test_env"
    AppsCloudPlugin::CustomEntity.create entity_type: "dylan", environment: env
    entity = AppsCloudPlugin::CustomEntity.new entity_type: "dylan", environment: Environment.default
    assert entity.save
  end
end
