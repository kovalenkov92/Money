class CategoriesController < ApplicationController

	def index
		categories = Category.all
		render json: {categories: categories}
	end

	def create
		category = Category.create name: params[:category][:name], balance_id: 1
		if category.errors.empty?
			render json: {ok: true}
		else
			render json: {errors: category.errors}, status: :unprocessable_entity
		end
	end

end