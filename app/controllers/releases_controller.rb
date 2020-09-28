class ReleasesController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!

  def new
    @release = Release.new
  end

  def create
    build_release
    build_user_record

    if @release.save && @record.save
      save_pictures
      redirect_to myrecords_path
    else
      render :new
    end
  end

  private

  def build_release
    @release = Release.new(release_params)
  end

  def build_user_record
    @record   = Record.new(
      release:   @release,
      user:      current_user,
      condition: params[:record][:condition],
      swappable: true
    )
  end

  def save_pictures
    photos = params.dig(:release, :pictures) || []
    photos.each do |photo|
      @record.pictures.create(photo: photo)
    end
  end

  def release_params
    params.require(:release).permit(:title, :artist, :label, :year, :genre_id, tracks_attributes: [:title, :position, :duration, :_destroy])
  end
end
