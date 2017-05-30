require 'test_helper'

class FgaPluginTest < ActiveSupport::TestCase

  should 'has a name' do
    refute FgaPlugin.plugin_name.blank?
  end

  should 'has a description' do
    refute FgaPlugin.plugin_description.blank?
  end

  should 'add a block' do
    assert_equal [FgaPlugin::TccBlock], FgaPlugin.extra_blocks.keys
  end

end
