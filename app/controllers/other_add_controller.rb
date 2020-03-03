class OtherAddController < ApplicationController
    def index
        @gadget = Gadget.new
        @gadget_view = Gadget.all
    end

    def create
        @g = gadget_params
        Gadget.create(gadget_params)
        gad = Gadget.order(created_at: :desc).limit(1)
        gad.update(review_point: 0, performance_point: 0, design_point: 0, costperformance_point: 0, feel_point: 0)
        #redirect_to '/other_add' 
    end

    def edit
        @id = params[:id]
        @gadget = Gadget.find(@id)
    end

    def update    
        Gadget.find(params[:id]).update(gadget_update_params)
        redirect_to '/other_add' 
    end
    #デモンストレーション用のコード
    def test
        @review_del = Review.maximum(:id)
        Review.find(@review_del).destroy
        redirect_to '/other_add'
    end

    private
    def gadget_params
        params.require(:gadget).permit(:gadget_name, :gadget_info, :gadget_url, :category_id, :image, :release_date)
    end

    def gadget_update_params
        params.require(:gadget).permit(:gadget_name, :gadget_info, :gadget_url, :category_id, :release_date)
    end

end
