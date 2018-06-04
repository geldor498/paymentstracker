class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
    @categories = categories_list
  end

  def edit
    @payment = Payment.find(params[:id])
    @categories = categories_list
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to @payment
    else
      @categories = categories_list
      render 'new'
    end
  end

  def show
    @payment = Payment.find(params[:id])
    @category = Category::find(@payment.category_id)
  end

  def update
    @payment = Payment.find(params[:id])
    @categories = categories_list    
    if @payment.update(payment_params)
      redirect_to @payment
    else
      render 'edit'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
 
    redirect_to payments_path
  end

  private
  def payment_params
    params[:payment]['user_id'] = current_user.id
    puts params[:payment]

    params.require(:payment).permit(:name, :ptype, :user_id, :amount, :category_id)
  end

  def categories_list
    categoriesList = Category::select(:id, :name).where(user: current_user.id)
    @categories = categoriesList.collect {|c| [c.name, c.id]}
  end
end
