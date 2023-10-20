class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end
  def new
    @user = current_user
    @group = Group.new
  end
  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user_id = @user.id
    
    if params[:group][:entity_id].present?
      @group.entity = Entity.find(params[:group][:entity_id])
    end

    if params[:group][:icon].present?
      @group.icon.attach(params[:group][:icon])
    end
  
    respond_to do |format|
      if @group.save
        format.html { redirect_to root_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end  

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
