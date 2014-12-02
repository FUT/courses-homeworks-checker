CoursesHomework::Admin.controllers :homeworks do
  get :index do
    @title = "Homeworks"
    @homeworks = Homework.all
    render 'homeworks/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'homework')
    @homework = Homework.new
    render 'homeworks/new'
  end

  post :create do
    @homework = Homework.new(params[:homework])
    if @homework.save
      @title = pat(:create_title, :model => "homework #{@homework.id}")
      flash[:success] = pat(:create_success, :model => 'Homework')
      params[:save_and_continue] ? redirect(url(:homeworks, :index)) : redirect(url(:homeworks, :edit, :id => @homework.id))
    else
      @title = pat(:create_title, :model => 'homework')
      flash.now[:error] = pat(:create_error, :model => 'homework')
      render 'homeworks/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "homework #{params[:id]}")
    @homework = Homework.find(params[:id])
    if @homework
      render 'homeworks/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'homework', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "homework #{params[:id]}")
    @homework = Homework.find(params[:id])
    if @homework
      if @homework.update_attributes(params[:homework])
        flash[:success] = pat(:update_success, :model => 'Homework', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:homeworks, :index)) :
          redirect(url(:homeworks, :edit, :id => @homework.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'homework')
        render 'homeworks/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'homework', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Homeworks"
    homework = Homework.find(params[:id])
    if homework
      if homework.destroy
        flash[:success] = pat(:delete_success, :model => 'Homework', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'homework')
      end
      redirect url(:homeworks, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'homework', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Homeworks"
    unless params[:homework_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'homework')
      redirect(url(:homeworks, :index))
    end
    ids = params[:homework_ids].split(',').map(&:strip)
    homeworks = Homework.find(ids)
    
    if Homework.destroy homeworks
    
      flash[:success] = pat(:destroy_many_success, :model => 'Homeworks', :ids => "#{ids.to_sentence}")
    end
    redirect url(:homeworks, :index)
  end
end
