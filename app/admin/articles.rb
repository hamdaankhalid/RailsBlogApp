# frozen_string_literal: true

ActiveAdmin.register Article do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :status, :internal_linkedin_schedulers, :content

  form do |f|
    f.inputs 'Articles' do
      f.input :title
      f.input :body
      f.input :content, as: :quill_editor
      f.input :status
    end
    f.actions
  end
end
