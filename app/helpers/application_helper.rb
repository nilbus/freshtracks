# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Return the base name (no extention) of the css and javascript files
  # associated with the current view.
  #
  # For example, when at the course index, it will return courses_index, so
  # the view can easily load courses_index.css and courses_index.js
  # if they exist.
  def current_action_include_filename(controller)
    current_action = controller.action_name
    substitutions = { "create" => "new", "update" => "edit" }
    substitutions.each { |k,v| current_action = current_action.sub(k, v) }
    return controller.controller_name() + '_' + current_action
  end

  # Check if public/stylesheets/(base_name).css exists
  def css_exists?(base_name)
    resource_exists?(base_name, 'stylesheets', 'css')
  end

  # Check if public/javascripts/(base_name).js exists
  def js_exists?(base_name)
    resource_exists?(base_name, 'javascripts', 'js')
  end

  # Time format for dateTime.strftime
  def time_format
    '%I:%M%p'
  end

  def generate_unique_id(base)
    "#{base}#{(rand*1000000).to_i}"
  end

  # These are also defined in javascripts/application.js
  def expand_button
    '<img border="0" src="/images/add_greyscale.png" class="collapsed">'.html_safe
  end

  def collapse_button
    '<img border="0" src="/images/delete_greyscale.png" class="expanded">'.html_safe
  end

  private
    def resource_exists?(base_name, subdir, extention)
      FileTest.exists?("public/#{subdir}/#{base_name}.#{extention}")
    end
end
