class TopsController < ApplicationController
    def index
        @gadget = Gadget.all.order(id: "DESC")
        @phones = Gadget.where(category_id: 1).order(id: "DESC")
        @pc = Gadget.where(category_id: 2).order(id: "DESC")
        @other = Gadget.where(category_id: 3).order(id: "DESC")
        @new_reviews = Gadget.joins("INNER JOIN reviews ON gadgets.id = reviews.gadget_id").select("gadgets.*, reviews.id AS reviews_id")
        @new_release_date = Gadget.all.order(release_date: "ASC")
    end

    def lists
        @gadget = Gadget.where('gadget_name LIKE ?', "%#{params[:serch_gadgtes]}%").order(id: "DESC")
    end
end
