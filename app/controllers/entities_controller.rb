class EntitiesController < ApplicationController
  def index
    @entities = current_user.entities
    @total_amount = @entities.sum(:amount)
  end

  def new
    @user = current_user
    @groups = Group.all
    @entity = Entity.new
  end

  def create
    @user = current_user
    @groups = Group.all
    @entity = Entity.new(entity_params)

    if @entity.save
      redirect_to user_entities_path(@user), notice: 'Entity was successfully created.'
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id, :user_id)
  end
end
