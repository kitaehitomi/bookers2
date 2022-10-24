class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end
  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user
  end
  def edit
    @books = Book.all
    @user = current_user
    @book = Book.find(params[:id])
    if @user==@book.user
    else
      redirect_to books_path
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id),notice: "Book was successfully updated."
    else
       render :edit

    end
  end
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      redirect_to book_path(@book.id),notice: 'You have created book successfully.'
    else
       @books = Book.all
      render :index

    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

