class TopsController < ApplicationController
    def index
        @gadget = Gadget.all.order(id: "DESC").limit(5)
        @new_reviews = Gadget.joins("INNER JOIN reviews ON gadgets.id = reviews.gadget_id").select("gadgets.*, reviews.id AS reviews_id").order(reviews_id: "DESC").limit(5)
        @new_release_date = Gadget.all.order(release_date: "DESC").limit(5)
        @phones = Gadget.where(category_id: 1).order(id: "DESC").limit(5)
        @pc = Gadget.where(category_id: 2).order(id: "DESC").limit(5)
        @other = Gadget.where(category_id: 3).order(id: "DESC").limit(5)
        @review_num = Review.joins("INNER JOIN gadgets ON gadgets.id = reviews.gadget_id").select("gadgets.gadget_name, gadgets.id,count(reviews.gadget_id) num_gadget").group('reviews.gadget_id').order('num_gadget desc').limit(5)    
        @gadget_num = Gadget.order(review_point: "DESC").limit(5) 
        @user_review_num = Review.joins("INNER JOIN gadgets ON gadgets.id = reviews.gadget_id").joins("INNER JOIN users ON users.id = reviews.user_id").select("users.id, users.user_name,count(users.id) num_user").group("users.id").order("num_user desc").limit(5) 
        @user_good_num = Review.joins("INNER JOIN empathies ON empathies.review_id = reviews.id").joins("INNER JOIN users ON users.id = reviews.user_id").select("users.id, users.user_name,count(empathies.review_id) num_emp").group("users.id").order("num_emp desc").limit(5) 
    end

    def lists
        if params[:gadgets] == "new_gadgets" then
            @gadget = Gadget.all.order(id: "DESC").page(params[:page]).per(5)
            @title = "カテゴリ： 新着ガジェット"
        elsif params[:gadgets] == "new_reviews" then
            @gadget = Gadget.joins("INNER JOIN reviews ON gadgets.id = reviews.gadget_id").select("gadgets.*, reviews.id AS reviews_id").order(reviews_id: "DESC").page(params[:page])
            @title = "カテゴリ： 新着レビュー"
        elsif params[:gadgets] == "new_release_date" then
            @gadget = Gadget.all.order(release_date: "DESC").page(params[:page]).per(5)
            @title = "カテゴリ： 発売日"
        elsif params[:gadgets] == "new_phones" then
            @gadget = Gadget.where(category_id: 1).order(id: "DESC").page(params[:page]).per(5)
            @title = "カテゴリ： スマートフォン"
        elsif params[:gadgets] == "new_pc" then
            @gadget = Gadget.where(category_id: 2).order(id: "DESC").page(params[:page]).per(5)
            @title = "カテゴリ： ＰＣ関連"
        elsif params[:gadgets] == "new_other" then
            @gadget = Gadget.where(category_id: 3).order(id: "DESC").page(params[:page]).per(5)
            @title = "カテゴリ： その他"
        elsif params[:search_gadgets] != "" then
            @gadget = Gadget.where('gadget_name LIKE ?', "%#{params[:search_gadgets]}%").order(id: "DESC").page(params[:page]).per(5)
            @title = "検索ワ－ド： #{params[:search_gadgets]}"
            if @gadget.empty?
                @title = "#{params[:search_gadgets]} の検索結果がありません"
            end
        else
            @gadget = Gadget.where(gadget_name: "").order(id: "DESC").page(params[:page]).per(5)
            @title = "検索結果がありません"
        end
    end

end
