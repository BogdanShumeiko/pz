class ProductsController < ApplicationController
  def index
    @products = Product.all # Получение списка всех акций
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new # Создание нового экземпляра акции
  end

  def create
    @product = Product.new(product_param) # Создание новой акции с переданными параметрами

    
    if @product.save
      redirect_to @product, notice: 'Акция успешно создана.' # Перенаправление на страницу списка акций с сообщением об успехе
    else
      render :new, status: 422
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Акция успешно создана.'
    else
      render :edit
    end
  end

  def buy
    @product = Product.find(params[:id])
    @product.owner = current_user.id
    @product.save
    redirect_to products_path, notice: 'Акция успешно куплена.'
  end

  def sell
    @product = Product.find(params[:id])
    @product.owner = nil
    @product.save
    redirect_to products_path, notice: 'Акция успешно продана.'
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    redirect_to products_url, notice: 'Объект успешно удалён.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :cost) # Удаляем .require(:product)
  end
  def product_param
    params.permit(:name, :cost) # Удаляем .require(:product)
  end
end
