class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @jobs = Job.all.descend
    respond_with(@jobs)
  end

  def search_by_city
    name = params[:city]
    @jobs = Job.where(city:"#{name}").descend
    respond_with(@jobs)
  end

  def search_by_category
    name = params[:category]
    @jobs = Job.where(category:"#{name}").descend
    respond_with(@jobs)
  end

  def search_by_type
    name = params[:jobtype]
    @jobs = Job.where(jobtype:"#{name}").descend
    respond_with(@jobs)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.save
    respond_with(@job)
  end

  def update
    @job.update(job_params)
    respond_with(@job)
  end

  def destroy
    @job.destroy
    respond_with(@job)
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :category, :city, :description, :perks, :how_to_apply, :company_name, :url, :is_featured, :jobtype)
    end
end
