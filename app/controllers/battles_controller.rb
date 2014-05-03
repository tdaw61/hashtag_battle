class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]
  before_action :tweet_config

  # GET /battles
  # GET /battles.json
  def index
    @battles = Battle.all
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
    first_search = @battle.tag_one + " -rt since:" + @battle.time_start.to_s + " until:" + @battle.time_end.to_s
    second_search = @battle.tag_two + " -rt since:" + @battle.time_start.to_s + " until:" + @battle.time_end.to_s
    @first_hashtag = @client.search(first_search)
    @second_hashtag = @client.search("#testingonlyone -rt since:2014-05-01 until:2014-05-03")
    @count_one = 0
    @count_two = 0
    @first_hashtag.each do |tweet|
      tweet.text
      @count_one = @count_one + 1
    end
    @second_hashtag.each do |tweet|
      @count_two = @count_two + 1
    end
  end

  # GET /battles/new
  def new
    @battle = Battle.new
  end

  # GET /battles/1/edit
  def edit
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(battle_params)

    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render :show, status: :created, location: @battle }
      else
        format.html { render :new }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battles/1
  # PATCH/PUT /battles/1.json
  def update
    respond_to do |format|
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params.require(:battle).permit(:name, :tag_one, :tag_two, :time_start, :time_end)
    end

    def tweet_config

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "itqQYmtLET0aiZeeAOgIj1EUh"
        config.consumer_secret     = "NVG0XfEkC8X4JRVmzY36jtKj2gLyKzM5VysMvCSbAwsjXPOJ59"
        config.access_token        = "582347028-WZJgv7FG3T89tpnBg6PdG7Z1rVT8kKJkfaXXHkqF"
        config.access_token_secret = "caOQm1OvwG3FrITdYPOyJblmR65NH9BNlCXtZgeVosQwy"
      end
    end
end
