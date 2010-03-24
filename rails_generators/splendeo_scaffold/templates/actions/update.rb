  def update
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      flash[:notice] = t('flash_notice_successfully_updated', :model => <%=class_name%>.human_name)
      redirect_to <%= item_path('url') %>
    else
      render :action => 'edit'
    end
  end
