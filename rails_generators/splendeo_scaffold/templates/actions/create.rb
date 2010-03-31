  def create
    if @<%= singular_name %>.save
      flash[:notice] = t('flash_notice_successfully_created', :model => <%=class_name%>.human_name)
      redirect_to <%= item_path('url') %>
    else
      render :action => 'new'
    end
  end
