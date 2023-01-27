class StudentsController < ApplicationController

  def index
    render json: Student.all, status: :ok
  end


  def show
    student = find_student
    if student
      render json: student
    else
      render json: { error: "Student not found" }, status: :not_found
    end
  end

  def create
    student = Student.create(student_params)
    render json: student, status: :created
  end

  def update
    student = find_student
    if student
      student.update(student_params)
      render json: student, status: :accepted
    else
      render json: { error: "Student not found"}, status: :not_found
    end
  end

  def destroy
    student = find_student
    if student
      student.destroy
      head :no_content
    else
      render json: { error: "Student not found"}, status: :not_found
    end
  end

  private

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end

  def find_student
    Student.find_by_id(params[:id])
  end

end
