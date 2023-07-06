class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]


  def index
    @book = Book.new
    @groups = current_user.groups
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end


  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image, :book_id)
  end

  def ensure_corrent_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to group_path
    end
  end
end
