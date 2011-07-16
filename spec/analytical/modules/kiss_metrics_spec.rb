require 'spec_helper'

describe Analytical::Modules::KissMetrics do
  include Split::Helper
  before(:each) do
    @parent = mock('api', :options=>{:google=>{:js_url_key=>'abc'}})
    @api = Analytical::Modules::KissMetrics.new :parent=>@parent, :js_url_key=>'abc'
  end
  describe "when no split session is set" do
    it "should behave like normal" do
      @api.should_not_receive(:set) 
      @api.process_queued_commands
    end
  end

  describe "when a split session is set" do
    it "should append set commands in queue" do
      first_alt = ab_test('link_colour', 'red', 'blue')
      second_alt = ab_test('link_text', 'Join', 'Signup')

      session[:split].should eql({'link_colour' => first_alt,'link_text' => second_alt})
      @api.stub(:session).and_return(session)
      
      @api.should_receive(:set).with(session[:split])
      @api.process_queued_commands
    end
  end
end

