ActiveAdmin.register Survey do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :due_date, questions_attributes: [:question_text, :id, :_destroy, responses_attributes: [:response_text]]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Survey" do
      f.input :name, label: "NAME", required: true
      f.input :due_date, label: "DUE DATE", required: true
    end
    f.inputs "Questions" do
      f.has_many :questions, allow_destroy: true, heading: false do |q|
        q.input :question_text, as: :string
      end
    end
    f.actions
  end

  show do
    panel "Survey" do
      table_for survey do
        column "Name" do |n|
          n.name
        end
        column "Due Date" do |d|
          d.due_date
        end
        table_for survey.questions do
          column "Questions" do |question|
            question.question_text
          end
        end
      end
    end
  end

  #permit_params(:question_text, :name)
end
