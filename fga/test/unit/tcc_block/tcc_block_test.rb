require 'test_helper'

class TccBlockTest < ActiveSupport::TestCase

  def setup

    @profile = Profile.new(name: "TCC", identifier: "tcc")
    @profile.save!

    engineering_names = ["Eletrônica" , "Software" , "Automotiva", "Aeroespacial", "Energia"]
    engineering_names.each do |engineering_name|
      article = Article.new(name: engineering_name, profile: @profile)
      article.save!
    end

    @block = TccBlock.new
  end

  should 'describe yourself' do
    refute TccBlock.description.blank?
  end

  should 'has a help' do
    refute @block.help.blank?
  end

  should 'has a title' do
    refute @block.view_title.blank?
  end

  should 'should create folder name string' do
    string = @block.concatenate_folder_name_string('Envio', '2017', '2')
    assert_equal 'Envio TCC 2017.2', string
  end

  should 'should create tcc folder' do
      @block.submition_phase = "Envio"
      @block.submition_year = 2020
      @block.submition_semester = 1
      @block.save

      folder = Article.find_by(name: "Envio TCC 2020.1")
      refute_nil folder
  end
end
