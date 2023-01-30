class InstructorsController < ApplicationController

  def index
    render json: Instructor.all, include: :students, status: :ok
  end

  def show
    instructor = find_instructor
    if instructor
      render json: instructor
    else
      render json: { error: "Instructor not found" }, status: :not_found
    end
  end

  def create
    instructor = Instructor.create(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = find_instructor
    if instructor
      Instructor.update(instructor_params)
      render json: instructor, status: :accepted
    else
      render json: { error: "Instructor not found"}, status: :not_found
    end
  end

  def destroy
    instructor = find_instructor
    if instructor
      instructor.destroy
      head :no_content
    else
      render json: { error: "Instructor not found"}, status: :not_found
    end
  end

  private

  def instructor_params
    params.permit(:name)
  end

  def find_instructor
    Instructor.find_by_id(params[:id])
  end

end
