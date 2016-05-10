class CategoriesController < ApplicationController
  def new
    @page_title = 'Add New Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created"

      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    flash[:notice] = 'Category Removed'

    redirect_to categories_path
  end

  def index
    @category = Category.all
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books 
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
