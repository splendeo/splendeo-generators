  def destroy
    @<%= singular_name %>.destroy
    flash[:notice] = t('flash_notice_successfully_destroyed', :model => <%=class_name%>.human_name)
    redirect_to <%= items_path('url') %>
  end
