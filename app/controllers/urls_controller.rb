require 'ShortlinkParser'

class UrlsController < ApplicationController
  # GET /urls
  # GET /urls.json
  def index
    @host = request.env['HTTP_HOST']
    #@urls = Url.all
    @urls = Url.includes(:visitors).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @urls }
    end
  end

  # GET /urls/1
  # GET /urls/1.json

  # GET /urls/:shortlink
  def show
    
    @url = Url.find(params[:id])
    #shortlink = ShortlinkParser.parse_shortlink(params[:shortlink], params[:short_url])
    
    #@url = Url.find(params[:shortlink])


    # if @url
    #   redirect_to @url.url, status: :moved_permanently
    # else
    #   render text: "url not found", status: :not_found
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @url }
    end
  end

  # GET /urls/new
  # GET /urls/new.json
  def new
    #@url = Url.new

    @url = Url.new(params[:url], request)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url }
    end
  end

  # GET /urls/1/edit
  def edit
    @url = Url.find(params[:id])
  end

  # POST /urls
  # POST /urls.json
  def create
    #@url = Url.new(params[:url])

    @url = Url.new(params[:url], request)

    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: 'Url was successfully created.' }
        format.json { render json: @url, status: :created, location: @url }
      else
        format.html { render action: "new" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /urls/1
  # PUT /urls/1.json
  def update
    @url = Url.find(params[:id])

    respond_to do |format|
      if @url.update_attributes(params[:url])
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    respond_to do |format|
      format.html { redirect_to urls_url }
      format.json { head :no_content }
    end
  end

  def redirect
    
    #shortlink = ShortlinkParser.parse_shortlink(params[:shortlink], params[:short_url])
    @url = Url.find_by_shortlink(params[:shortlink])
    @url.visitors.new({:ip => request.env['HTTP_REFERER'], :location => 'US'})
    @url.save

    if @url
      redirect_to @url.url, status: :moved_permanently
    else
      render text: "url not found", status: :not_found
    end

  end

end
