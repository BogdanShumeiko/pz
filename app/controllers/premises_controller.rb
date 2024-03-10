class PremisesController < ApplicationController
  def index
    @premises = Premise.all # Получение списка всех акций
  end

  def show
    @premise = Premise.find(params[:id])
  end

  def new
    @premise = Premise.new # Создание нового экземпляра акции
  end

  def create
    @premise = Premise.new(premise_param) # Создание новой акции с переданными параметрами

    
    if @premise.save
      redirect_to @premise, notice: 'Акция успешно создана.' # Перенаправление на страницу списка акций с сообщением об успехе
    else
      render :new, status: 422
    end
  end

  def edit
    @premise = Premise.find(params[:id])
  end

  def update
    @premise = Premise.find(params[:id])
    if @premise.update(premise_params)
      redirect_to @premise, notice: 'Акция успешно создана.'
    else
      render :edit
    end
  end

  def buy
    @premise = Premise.find(params[:id])
    @premise.owner = current_user.id
    @premise.save
    redirect_to premises_path, notice: 'Акция успешно куплена.'
  end

  def sell
    @premise = Premise.find(params[:id])
    @premise.owner = nil
    @premise.save
    redirect_to premises_path, notice: 'Акция успешно продана.'
  end

  def destroy
    @premise = Premise.find(params[:id])
    @premise.destroy
    
    redirect_to premises_url, notice: 'Объект успешно удалён.'
  end

  private

  def premise_params
    params.require(:premise).permit(:name, :cost, :square_meters) # Удаляем .require(:premise)
  end
  def premise_param
    params.permit(:name, :cost, :rooms, :square_meters) # Удаляем .require(:premise)
  end
end
