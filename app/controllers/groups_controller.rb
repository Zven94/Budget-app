class GroupsController < ApplicationController
  include GroupsHelper
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def new
    @user = current_user
    @group = Group.new
  end

  def show
    @group = Group.includes(:entities).find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, notice: 'Group was successfully deleted.'
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user_id = @user.id

    @group.entity = Entity.find(params[:group][:entity_id]) if params[:group][:entity_id].present?

    @group.icon.attach(params[:group][:icon]) if params[:group][:icon].present?

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

  def total_transaction_amount(group)
    group.transactions.sum(:amount)
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
