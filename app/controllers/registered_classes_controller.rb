class RegisteredClassesController < ApplicationController
  # classes registered for current semester
  def index
    @registered_classes = RegisteredClasses.all
  end

  # register for a class
  def create
    @registered_class = RegisteredClass.new(params[:registered_class])
    @registered_class.save
  end

  # change attributes of registered class, like credit/audit
  def update
    @registered_class = RegisteredClass.find(params[:id])
    @registered_class.update_attributes(params[:registered_class])
  end

  # unregister
  def destroy
    @registred_class.find(params[:id]).destroy
  end

end
