class Analytical::Modules::KissMetrics
  def process_queued_commands
    #TODO shift this to split instead of Analytical so it is only set once per person
    queue(:set, session[:split]) unless session[:split].nil?
    super
  end

end
