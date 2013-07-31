class PapersController < ApplicationController
  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.paginate(:page => params[:page], :per_page => 20, :order => 'updated_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @papers }
    end
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @paper = Paper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paper }
    end
  end

  # GET /papers/new
  # GET /papers/new.json
  def new
    @paper = Paper.new
    @paper[:file_user] = current_user.email
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paper }
    end
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
    # @paper[:file_user] = @paper[:file_user] == '' ? current_user.email : @paper[:file_user]
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(params[:paper])
    @paper['file_path'] = DataFile.save(params[:paper])
    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render json: @paper, status: :created, location: @paper }
      else
        format.html { render action: "new" }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /papers/1
  # PUT /papers/1.json
  def update
    @paper = Paper.find(params[:id])
    params[:paper][:file_path] = DataFile.save(params[:paper])
    respond_to do |format|
      if @paper.update_attributes(params[:paper])
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to papers_url }
      format.json { head :no_content }
    end
  end
end
