class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.paginate(:page => params[:page], :per_page => 20, :order => 'updated_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
    # @cities = City.where(:status => 1).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    #1^2^3
    link_array = @customer["link"].split("^")
    zhiwu_array = @customer["zhiwu"].split("^")
    dh_array = @customer["dh"].split("^")
    sj_array = @customer["sj"].split("^")
    em_array = @customer["em"].split("^")
    cz_array = @customer["cz"].split("^")
    bz_array = @customer["bz"].split("^")

    for i in 0..6 do 
      Customer.set "link#{i + 1}", link_array[i] == nil ? "":link_array[i]
      Customer.set "zhiwu#{i + 1}", zhiwu_array[i] == nil ? "":zhiwu_array[i]
      Customer.set "dh#{i + 1}", dh_array[i] == nil ? "":dh_array[i]
      Customer.set "sj#{i + 1}", sj_array[i] == nil ? "":sj_array[i]
      Customer.set "em#{i + 1}", em_array[i] == nil ? "":em_array[i]
      Customer.set "cz#{i + 1}", cz_array[i] == nil ? "":cz_array[i]
      Customer.set "bz#{i + 1}", bz_array[i] == nil ? "":bz_array[i]
    end
  end

  # POST /customers
  # POST /customers.json
  def create
    
    @params = handle_params(params)

    @customer = Customer.new(@params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])
    @params = handle_params(params)
    respond_to do |format|
      if @customer.update_attributes(@params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  def handle_params (params)
    link = params[:link1] + "^" + params[:link2] + "^" + params[:link3] + 
    "^" + params[:link4] + "^" + params[:link5] + "^" + params[:link6] +  
    "^" + params[:link7]

    zhiwu = params[:zhiwu1] + "^" + params[:zhiwu2] + "^" + params[:zhiwu3] + 
    "^" + params[:zhiwu4] + "^" + params[:zhiwu5] + "^" + params[:zhiwu6] +
    "^" + params[:zhiwu7]

    dh = params[:dh1] + "^" + params[:dh2] + "^" + params[:dh3] + 
    "^" + params[:dh4] + "^" + params[:dh5] + "^" + params[:dh6] + "^" + params[:dh7] 

    sj = params[:sj1] + "^" + params[:sj2] + "^" + params[:sj3] + "^" + params[:sj4] + 
    "^" + params[:sj5] + "^" + params[:sj6] + "^" + params[:sj7]

    em = params[:em1] + "^" + params[:em2] + "^" + params[:em3] + "^" + params[:em4] + 
    "^" + params[:em5] + "^" + params[:em6] + "^" + params[:em7]

    cz = params[:cz1] + "^" + params[:cz2] + "^" + params[:cz3] + "^" + params[:cz4] + 
    "^" + params[:cz5] + "^" + params[:cz6] + "^" + params[:cz7]

    bz = params[:bz1] + "^" + params[:bz2] + "^" + params[:bz3] + "^" + params[:bz4] + 
    "^" + params[:bz5] + "^" + params[:bz6] + "^" + params[:bz7]


    @params = params[:customer].merge(:link => link, :zhiwu => zhiwu, :dh => dh,
     :sj => sj, :em => em, :cz => cz, :bz => bz)
  end

end
