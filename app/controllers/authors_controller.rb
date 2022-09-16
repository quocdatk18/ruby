class AuthorsController < ApplicationController
  before_action :set_author, only: %i[edit update destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find_by(id: params[:id])
    if @author.present?
      @books_author = @author.books
    else
      flash[:error] = 'Invalid Author'
      redirect_to authors_path
    end
  end

  def create
    @author = Author.new(list_params)
    if @author.save
      redirect_to authors_path
    else
      flash.now[:alert] = 'Invalid input value !!!'
      render :new
    end
  end

  def edit
    redirect_to authors_path if @author.nil?
  end

  def update
    if @author.update(list_params)
      redirect_to authors_path
    else
      flash.now[:alert] = 'Invalid input value !!!'
      render :edit
    end
  end

  def destroy
    flash[:error] = 'Invalid Author' unless @author&.destroy
    redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find_by(id: params[:id])
  end

  def list_params
    params.require(:author).permit(:first_name, :last_name, :title)
  end
end
