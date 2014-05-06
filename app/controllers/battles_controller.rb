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
    #go through each hashtag for the battle, and search from the start date to the end date
    @battle.hashtags.each do |hashtag|
      count = 0
      last_tweet_id = 0
      #@battle.time_end = @battle.time_end + 1.day
      search = hashtag.content + " -rt since:" + @battle.time_start.to_s + " until:" + (@battle.time_end + 1.day).to_s
      search_results = @client.search(search)
      search_results.each do |tweet|
        count = count + 1
        last_tweet_id = tweet.id
      end
      hashtag.count = count

      #update the hashtag to have the actual count, since twitter search api only keeps valid data for a week.
      #Also keep track of last tweet ID counted, so you can start count from there next time.
      @db_hashtag = Hashtag.find(hashtag[:id])
      unless count == @db_hashtag.count
        @db_hashtag.count = count
        @db_hashtag.last_tweet_id = last_tweet_id
      end
    end
  end

  # GET /battles/new
  def new
    #set up hashtags attributes. Start with 2 for standard battle.
    @battle = Battle.new
    @battle.hashtags.build
    @battle.hashtags.build
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
      #params.require(:battle).permit(:name, :time_start, :time_end, :hashtags_attributes)
      params.require(:battle).permit!
    end

    #initialize and authorize the client to use twitter search API.
    def tweet_config

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "itqQYmtLET0aiZeeAOgIj1EUh"
        config.consumer_secret     = "NVG0XfEkC8X4JRVmzY36jtKj2gLyKzM5VysMvCSbAwsjXPOJ59"
        config.access_token        = "582347028-WZJgv7FG3T89tpnBg6PdG7Z1rVT8kKJkfaXXHkqF"
        config.access_token_secret = "caOQm1OvwG3FrITdYPOyJblmR65NH9BNlCXtZgeVosQwy"
      end
    end
end
