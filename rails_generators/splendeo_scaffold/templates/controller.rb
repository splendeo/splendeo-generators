class <%= plural_class_name %>Controller < ApplicationController

<%- if actions_with_find.length > 0 -%>
  before_filter :find_<%= singular_name %>, :only => [ <%= actions_with_find.collect{|a| ":#{a}"}.join(', ') %> ]
<%- end -%>

  <%= controller_methods :actions %>

<%- if actions_with_find.length > 0 -%>
  protected

  def find_<%= singular_name %>
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
end
