class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: [:show, :destroy, :edit, :update]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)
    
    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @badge.destroy
    redirect_to admin_badge_path(@badge)
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule, :criteria)
  end

end
