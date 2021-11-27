class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    @category.save ? redirect_to(admin_categories_path) : render(:new)
  end

  def show; end

  def edit; end

  def update
    @category.update(category_params) ? redirect_to(admin_categories_path) : render(:edit)
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
