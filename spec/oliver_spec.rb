require 'spec_helper'
require_relative '../lib/oliver'

describe Oliver do
  before :each do

    describe "#new" do
      it "creates a new instance of oliver with no arguments" do
        Oliver.run(''))
      end
    end

    describe "#version" do
    it "returns the version" do
      Oliver.run('version')
      end
    end

  end
end
