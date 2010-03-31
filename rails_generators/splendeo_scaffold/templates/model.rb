class <%= class_name %> < ActiveRecord::Base
  attr_accessible <%= attributes.map { |a| ":#{a.name}" }.join(", ") %>
<%- if declarative? -%>
  using_access_control
<%- end -%>
end
