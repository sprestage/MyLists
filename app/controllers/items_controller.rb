class ItemsController < ApplicationController
  # # GET /items
  # # GET /items.json
  # GET /lists/:list_id/items
  # GET /lists/:list_id/items.json
  def index
    list = List.find(params[:list_id])
    @items = list.items
    # @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # # GET /items/1
  # # GET /items/1.json
  # GET /lists/1/items/1
  # GET /items/1.json
  def show
    list = List.find(params[:list_id])
    @item = list.items.find(params[:id])
    # @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # # GET /items/new
  # # GET /items/new.json
  # GET /lists/:list_id/items/new
  # GET /lists/:list_id/items/new.json
  def new
    list = List.find(params[:list_id])
    @item = list.items.build
    # @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # # GET /items/1/edit
  # GET /lists/:list_id/items/1/edit
  def edit
    list = List.find(params[:list_id])
    @item = list.items.find(params[:id])
    # @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    list = List.find(params[:list_id])
    @item = list.items.create(params[:item])
    # @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to [@item.list, @item], notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: [@item.list, @item] }
        # @item.list.item_id << @item
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PUT /items/1
  # # PUT /items/1.json
  # PUT /lists/:list_id/items/1
  # PUT /lists/:list_id/items/1.json
  def update
    # @item = Item.find(params[:id])
    list = List.find(params[:list_id])
    @item = list.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item.list, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /items/1
  # # DELETE /items/1.json
  # DELETE /lists/:list_id/items/1
  # DELETE /lists/:list_id/items/1.json
  def destroy
    list = List.find(params[:list_id])
    @item = list.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to (list_items_url) }
      format.json { head :no_content }
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
