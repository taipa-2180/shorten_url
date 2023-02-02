class UrlsController < ApplicationController
  def encode
    @url = Url.create(original_url: params[:url])
    render json: { code: @url.code }
  end
  
  def decode
    @url = Url.find_by(code: code)
    render json: { original_url: @url.original_url }
  end

  private

  def code
    @code ||= URI(params[:shorten_url]).path[1..-1]
  end
end
