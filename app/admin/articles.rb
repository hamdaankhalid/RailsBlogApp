# frozen_string_literal: true

ActiveAdmin.register Article do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :status, :content

  show do |article|
    attributes_table do
      row :title
      row :status
      attributes_table_for article.content do
        row :body
      end
    end
  end

  form do |f|
    f.inputs 'Articles' do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :status
    end
    f.actions
  end
end
