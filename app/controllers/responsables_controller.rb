class ResponsablesController < ApplicationController
  before_filter :requerir_responsable

  # GET /responsables
  # GET /responsables.xml
  def index
    @responsables = Responsable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @responsables }
    end
  end

  # GET /responsables/1
  # GET /responsables/1.xml
  def show
    @responsable = Responsable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @responsable }
    end
  end

  # GET /responsables/new
  # GET /responsables/new.xml
  def new
    @responsable = Responsable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @responsable }
    end
  end

  # GET /responsables/1/edit
  def edit
    @responsable = Responsable.find(params[:id])
  end

  # POST /responsables
  # POST /responsables.xml
  def create
    @responsable = Responsable.new(params[:responsable])

    respond_to do |format|
      if @responsable.save
        format.html { redirect_to(@responsable, :notice => 'Responsable creado correctamente') }
        format.xml  { render :xml => @responsable, :status => :created, :location => @responsable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @responsable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /responsables/1
  # PUT /responsables/1.xml
  def update
    @responsable = Responsable.find(params[:id])

    respond_to do |format|
      if @responsable.update_attributes(params[:responsable])
        format.html { redirect_to(@responsable, :notice => 'Responsable actualizado correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @responsable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /responsables/1
  # DELETE /responsables/1.xml
  def destroy
    @responsable = Responsable.find(params[:id])
    @responsable.destroy

    respond_to do |format|
      format.html { redirect_to(responsables_url) }
      format.xml  { head :ok }
    end
  end

  # GET /responsables/autocompletar.js
  def autocompletar
    @responsables = Responsable.con_nombre(params[:term])

    respond_to do |format|
      format.js { render text: @responsables.map(&:to_s) }
    end
  end
end
