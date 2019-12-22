class OtherAddController < ApplicationController
    def index
        @gadget = Gadget.new
        @gadget_view = Gadget.all
    end

    def create
        @g = gadget_params
        Gadget.create(gadget_params)
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

    def test
        
    end

    private
    def gadget_params
        params.require(:gadget).permit(:gadget_name, :gadget_info, :gadget_url, :category_id, :image, :release_date)
    end

    def gadget_update_params
        params.require(:gadget).permit(:gadget_name, :gadget_info, :gadget_url, :category_id, :release_date)
    end

end
