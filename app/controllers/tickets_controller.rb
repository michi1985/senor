class TicketsController < ApplicationController

  before_action :authenticate_user!, :set_store, except: [:index]

  # Storeコントローラのshowアクションへ実装
  def index
    # @ticket = Ticket.all
    @q = Ticket.ransack(params[:q])
    @ticket = @q.result(distinct: true)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = @store.tickets.build
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = @store.tickets.build(ticket_params)
    if @ticket.save
      flash[:success] = "インシデントを登録しました。"
      redirect_to [@customer, @store, @ticket]
    else
      render :new
    end
  end

  def update
    @ticket = @store.tickets.find(params[:id])
    if @ticket.update_attributes(ticket_params) #update_attributesはSaveもする
      flash[:success] = "インシデントを更新しました。"
      redirect_to [@customer, @store, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @tikcket = Ticket.find(params[:id]).destroy
    flash[:success] = "インシデントを削除しました。"
    redirect_to customer_store_tickets_url
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :status, :received_user_id, :assign_user_id, :close_date, :close_time, :limit_date, :sender, :receive_date, :receive_time, :content, :detail, :result, :remarks)
  end

  def set_store
    @customer = Customer.find(params[:customer_id])
    @store = Store.find(params[:store_id])
  end

end
