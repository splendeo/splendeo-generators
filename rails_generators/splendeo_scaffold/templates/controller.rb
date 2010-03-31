class <%= plural_class_name %>Controller < ApplicationController

<%- if declarative? -%>
  filter_resource_access
<%- elsif cancan? -%>
  load_and_authorize_resource
<%- else -%>
  <%- if member_actions.length > 0 -%>
  before_filter :load_<%= singular_name %>, :only => [ <%= member_actions.collect{|a| ":#{a}"}.join(', ') %> ]
  <%- end -%>
  <%- if new_actions.length > 0 -%>
  before_filter :new_<%= singular_name %>_from_params, :only => [ <%= new_actions.collect{|a| ":#{a}"}.join(', ') %> ]
  <%- end -%>
<%- end -%>

  <%= controller_methods :actions %>

protected

<%- if authorization_framework == nil -%>

  <%- if new_actions.length > 0 -%>
  def new_<%= singular_name %>_from_params
    @<%= singular_name %> = <%= class_name %>.new(params[:<%= singular_name %>])
  end
  <%- end -%>

  <%- if member_actions.length > 0 -%>
  def load_<%= singular_name %>
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
    rescue ActiveRecord::RecordNotFound => msg
    flash[:error] = msg
    <%- if action?(:index) -%>
      redirect_to :action => :index
    <%- else -%>
      redirect_to root_path
    <%- end -%>
  end
  <%- end -%>

<%- end -%>
end
