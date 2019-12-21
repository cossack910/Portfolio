class TopsController < ApplicationController
    def index
        @gadget = Gadget.all.order(id: "DESC")
        @new_reviews = Gadget.joins("INNER JOIN reviews ON gadgets.id = reviews.gadget_id").select("gadgets.*, reviews.id AS reviews_id").order(reviews_id: "DESC")
        @new_release_date = Gadget.all.order(release_date: "DESC")
        @phones = Gadget.where(category_id: 1).order(id: "DESC")
        @pc = Gadget.where(category_id: 2).order(id: "DESC")
        @other = Gadget.where(category_id: 3).order(id: "DESC")
    end

    def lists
        if params[:gadgets] == "new_gadgets" then
            @gadget = Gadget.all.order(id: "DESC").page(params[:page]).per(3)
            @title = "カテゴリ： 新着ガジェット"
        elsif params[:gadgets] == "new_reviews" then
            @gadget = Gadget.joins("INNER JOIN reviews ON gadgets.id = reviews.gadget_id").select("gadgets.*, reviews.id AS reviews_id").order(reviews_id: "DESC").page(params[:page]).per(3)
            @title = "カテゴリ： 新着レビュー"
        elsif params[:gadgets] == "new_release_date" then
            @gadget = Gadget.all.order(release_date: "DESC").page(params[:page]).per(3)
            @title = "カテゴリ： 発売日"
        elsif params[:gadgets] == "new_phones" then
            @gadget = Gadget.where(category_id: 1).order(id: "DESC").page(params[:page]).per(3)
            @title = "カテゴリ： スマートフォン"
        elsif params[:gadgets] == "new_pc" then
            @gadget = Gadget.where(category_id: 2).order(id: "DESC").page(params[:page]).per(3)
            @title = "カテゴリ： ＰＣ関連"
        elsif params[:gadgets] == "new_other" then
            @gadget = Gadget.where(category_id: 3).order(id: "DESC").page(params[:page]).per(3)
            @title = "カテゴリ： その他"
        elsif params[:search_gadgets] != "" then
            @gadget = Gadget.where('gadget_name LIKE ?', "%#{params[:search_gadgets]}%").order(id: "DESC").page(params[:page]).per(3)
            @title = "検索ワ－ド： #{params[:search_gadgets]}"
            if @gadget.empty?
                @title = "#{params[:search_gadgets]} の検索結果がありません"
            end
        else
            @gadget = Gadget.where(gadget_name: "").order(id: "DESC").page(params[:page]).per(3)
            @title = "検索結果がありません"
        end
    end

end
