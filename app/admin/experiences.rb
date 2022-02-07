ActiveAdmin.register Experience do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :organization, :title, :description, :started_at, :ended_at, :order,  :type_of
  #
  # or
  #
  # permit_params do
  #   permitted = [:organization, :title, :description, :started_at, :ended_at, :type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
