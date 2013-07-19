require_relative '../../test_helper'
 
describe Flika::Api do
  subject { Flika::Api }
  describe "initializing api" do
    it "must have a source" do
      subject.must_respond_to(:echo)
    end
  end
end
