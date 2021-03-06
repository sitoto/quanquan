﻿#encoding: UTF-8
require 'nokogiri'
require 'open-uri'

class RatesController < ApplicationController
  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rates }
    end
  end

  # GET /rates/1
  # GET /rates/1.json
  def show
    @rate = Rate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rate }
    end
  end

  # GET /rates/new
  # GET /rates/new.json
  def new
    @rate = Rate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rate }
    end
  end

  # GET /rates/1/edit
  def edit
    @rate = Rate.find(params[:id])
  end

  # POST /rates
  # POST /rates.json
  def create
    @rate = Rate.new(params[:rate])
	m_id = @rate.out_num
	site = @rate.site
	case site
	 when "MTime"
		url = "http://service.mtime.com/database/databaseService.m?Ajax_CallBack=true&Ajax_CallBackType=Mtime.Community.Controls.CommunityPages.DatabaseService&Ajax_CallBackMethod=LoadData2&Ajax_CrossDomain=1&Ajax_RequestUrl=a&Ajax_CallBackArgument0=1&Ajax_CallBackArgument1=#{m_id}"
		html = open(url).read
		str = html.scan(/"rating"\:[0-9 .]*/)[0]
		@rate.rating =  str.split(":")[1] 
	 when "豆瓣"
		url = "http://movie.douban.com/subject/#{m_id}/"
		html = Nokogiri::HTML(open(url).read)
		@rate.rating =  html.at_css("strong.rating_num").text
	 when "M1905"
		url = "http://www.m1905.com/mdb/film/#{m_id}/"
		html = open(url).read
		str = html.scan(/var score = \'[0-9 .]*/)[0]
		@rate.rating =  str.split("'")[1]
	 else 
		@rate.rating =  "无"
	 end  
	
	


    respond_to do |format|
      if @rate.save
        format.html { redirect_to @rate, notice: 'Rate was successfully created.' }
        format.json { render json: @rate, status: :created, location: @rate }
      else
        format.html { render action: "new" }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rates/1
  # PUT /rates/1.json
  def update
    @rate = Rate.find(params[:id])

    respond_to do |format|
      if @rate.update_attributes(params[:rate])
        format.html { redirect_to @rate, notice: 'Rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy

    respond_to do |format|
      format.html { redirect_to rates_url }
      format.json { head :no_content }
    end
  end
end
