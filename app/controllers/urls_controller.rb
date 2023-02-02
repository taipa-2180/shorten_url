class UrlsController < ApplicationController
  def encode
    @url = Url.create(original_url: params[:url])
    render json: { shortened_url: "#{host_name}/#{@url.code}" }
  end
  
  def decode
    if url.present?
      redirect_to URI(url.original_url).to_s
    else
      render json: { message: "Not Found URL" }, status: 404
    end
  end

  private

  def url
    @url ||= Rails.cache.fetch("accessing_url", expires_in: 1.hours) do
      Url.find_by(code: params[:code])
    end
  end
end
