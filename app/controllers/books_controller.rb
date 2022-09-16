# frozen_string_literal: true

# class BooksControlle
class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def show
    @book = Book.includes(:author, :supplier).find_by(id: params[:id])
    return unless @book.nil?

    flash[:error] = 'Invalid Book'
    redirect_to books_path
  end

  def new
    @book = Book.new
    @authors = Author.all
    @suppliers = Supplier.all
  end

  def create
    @book = Book.new(list_params)
    if @book.save
      redirect_to books_path
    else
      flash.now[:alert] = 'Invalid input value !!!'
      render :new
    end
  end

  def edit
    redirect_to books_path if @book.nil?
  end

  def update
    if @book.update(list_params)
      redirect_to books_path
    else
      flash.now[:alert] = 'Invalid input value !!!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    flash[:error] = 'Invalid Book' unless @book&.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def list_params
    params.require(:book).permit(:title, :year_published, :isbn, :price, :out_of_print, :views, :supplier_id,
                                 :author_id)
  end
end
