class ReportsController < ApplicationController
  def index
    puts params
    @search = Search.new()
    if params[:search]

      @sp = search_params
      @search.cname = @sp[:cname]
      puts @sp
      @search.dtto = @sp[:dtto]
      @search.dtfrom = @sp[:dtfrom]
      @search.ptype = @sp[:ptype]
      @rows = Payment::joins(:category)
              .where( "categories.name like :query", query:"%#{@search.cname}%")
              .where(user: current_user.id)
              .where("payments.created_at >?", @search.dtfrom)
              .where("payments.created_at <?", @search.dtto)
    else
      @rows = Payment::joins(:category).where(user: current_user.id)
    end
    puts '_____________________'
  end

  def search_params
    puts params
    params[:search]['user_id'] = current_user.id
    params.require(:search).permit(:cname, :ctype, :cname, :ptype, :dtto, :dtfrom, :user_id)
  end
end
