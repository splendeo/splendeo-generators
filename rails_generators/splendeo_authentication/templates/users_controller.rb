class <%= user_plural_class_name %>Controller < ApplicationController
  def new
    @<%= user_singular_name %> = <%= user_class_name %>.new
  end
  
  def create
    @<%= user_singular_name %> = <%= user_class_name %>.new(params[:<%= user_singular_name %>])
    if @<%= user_singular_name %>.save
    <%- unless options[:authlogic] -%>
      session[:<%= user_singular_name %>_id] = @<%= user_singular_name %>.id
    <%- end -%>
      flash[:notice] = t('flash_notice_signed_up')
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end
