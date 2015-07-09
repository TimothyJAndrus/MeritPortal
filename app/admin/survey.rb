ActiveAdmin.register Survey do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  form do |f|
    f.input :name, label: "NAME", required: true
    f.inputs "Questions" do
      f.has_many :questions, allow_destroy: true, heading: false, sortable: :id do |q|
        q.input :question_text
      end
    end
    f.actions
  end

  permit_params(:question_text, :name)

end
