class KittensController < ApplicationController

  def  index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = 'Successfully saved a new Kitten'
      redirect_to @kitten
    else
      flash.now[:error] = 'Failed to save the fluffiness.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success] = 'Successfully updated a new Kitten'
      redirect_to @kitten
    else
      flash.now[:error] = 'Failed to update the fluffiness.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    flash[:success] = 'Successfully destroyed a ball of fluff.'
    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
