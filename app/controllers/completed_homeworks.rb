CoursesHomework::App.controllers :completed_homeworks do

  get :index do
    @accounts = Account.all
    @homeworks = Homework.all
    render 'index'
  end

  get :new do
    @homeworks = Homework.all
    @completed_homework = CompletedHomework.new
    render 'new'
  end

  post :create do
    current_account = Account.last
    @completed_homework = current_account.completed_homeworks.new params[:completed_homework]
    if @completed_homework.save
      redirect_to :index
    else
      render 'new'
    end
  end
end
