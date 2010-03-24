class <%= session_plural_class_name %>Controller < ApplicationController
<%- if options[:authlogic] -%>
  def new
    @<%= session_singular_name %> = <%= session_class_name %>.new
  end
  
  def create
    @<%= session_singular_name %> = <%= session_class_name %>.new(params[:<%= session_singular_name %>])
    if @<%= session_singular_name %>.save
      flash[:notice] = t('flash_notice_logged_in')
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = t('flash_error_invalid_login')
      render :action => 'new'
    end
  end
  
  def destroy
    @<%= session_singular_name %> = <%= session_class_name %>.find
    @<%= session_singular_name %>.destroy
    flash[:notice] = t('flash_notice_logged_out')
    redirect_to root_url
  end
<%- else -%>
  def new
  end
  
  def create
    <%= user_singular_name %> = <%= user_class_name %>.authenticate(params[:login], params[:password])
    if <%= user_singular_name %>
      session[:<%= user_singular_name %>_id] = <%= user_singular_name %>.id
      flash[:notice] = t('flash_notice_logged_in')
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = t('flash_error_invalid_login')
      render :action => 'new'
    end
  end
  
  def destroy
    session[:<%= user_singular_name %>_id] = nil
    flash[:notice] = t('flash_notice_logged_out')
    redirect_to root_url
  end
<%- end -%>
end
