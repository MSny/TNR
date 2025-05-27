class Api::V1::CatsController < ApplicationController
  before_action :set_cat, only: [:show, :update, :destroy, :upload_photo]

  def index
    @cats = Cat.includes(:locations, :contacts)
                .page(params[:page])
                .per(20)
    
    render json: {
      cats: @cats.map { |cat| cat_json(cat) },
      meta: {
        current_page: @cats.current_page,
        total_pages: @cats.total_pages,
        total_count: @cats.total_count
      }
    }
  end

  def show
    render json: cat_json(@cat)
  end

  def create
    @cat = Cat.new(cat_params)
    
    if @cat.save
      render json: cat_json(@cat), status: :created
    else
      render json: { errors: @cat.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @cat.update(cat_params)
      render json: cat_json(@cat)
    else
      render json: { errors: @cat.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy
    head :no_content
  end

  def upload_photo
    if params[:photo].present?
      @cat.photos.attach(params[:photo])
      render json: { message: 'Photo uploaded successfully' }
    else
      render json: { error: 'No photo provided' }, status: :bad_request
    end
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :age, :gender, :color, :description, 
                                :status, :spayed_neutered, :microchipped, :health_notes)
  end

  def cat_json(cat)
    {
      id: cat.id,
      name: cat.name,
      age: cat.age,
      gender: cat.gender,
      color: cat.color,
      description: cat.description,
      status: cat.status,
      spayed_neutered: cat.spayed_neutered,
      microchipped: cat.microchipped,
      health_notes: cat.health_notes,
      locations: cat.locations.map { |loc| { id: loc.id, name: loc.name } },
      photos: cat.photos.attached? ? cat.photos.map { |photo| rails_blob_url(photo) } : [],
      created_at: cat.created_at,
      updated_at: cat.updated_at
    }
  end
end