class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.all
  end

  def show 
  
    @subcategory = Subcategory.find(params[:id])
  end

  def new 
    @subcategory = Subcategory.new
    @categories = Category.all
end
 
 def create
   @subcategory = Subcategory.new(category_params)

   if @subcategory.save
    redirect_to subcategories_path
   else
    render :new, status: :unprocessable_entity
   end 
  end


  def edit
    @subcategory = Subcategory.find(params[:id])
    @categories = Category.all
  end

  def update
    @subcategory = Subcategory.find(params[:id])

    if @subcategory.update(category_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessebly_entity
    end 
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy

    redirect_to root_path, status: :see_other
  end



  private
  def category_params
    params.require(:category).permit(:name, :category_id) 
  end


   end 
