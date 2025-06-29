class ResumeBulletsController < ApplicationController
  before_action :set_resume_bullet, only: [ :show, :destroy ]

  def index
    @resume_bullets = ResumeBullet.order(created_at: :desc).limit(5)
  end

  def new
    @resume_bullet = ResumeBullet.new
  end

  def show
  end

  def create
    @resume_bullet = ResumeBullet.new(resume_bullet_params)
    if @resume_bullet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @resume_bullet.destroy
    redirect_to resume_bullets_path
  end

  private

  def set_resume_bullet
    @resume_bullet = ResumeBullet.find(params[:id])
  end

  def resume_bullet_params
    params.require(:resume_bullet).permit(:job_title, :start_date, :end_date, :company, :content)
  end
end
