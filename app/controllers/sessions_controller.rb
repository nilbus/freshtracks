class SessionsController < Clearance::SessionsController
  skip_before_filter :choose_semester
  skip_before_filter :load_schedule
end
