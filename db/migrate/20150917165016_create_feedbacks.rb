class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.boolean :encounters_frustrating
      t.boolean :encounters_fun
      t.boolean :encounters_simple
      t.boolean :encounters_complex
      t.boolean :encounters_logical
      t.boolean :encounters_appealing
      t.boolean :encounters_unappealing

      t.boolean :items_frustrating
      t.boolean :items_fun
      t.boolean :items_simple
      t.boolean :items_complex
      t.boolean :items_logical
      t.boolean :items_appealing
      t.boolean :items_unappealing

      t.boolean :classes_frustrating
      t.boolean :classes_fun
      t.boolean :classes_simple
      t.boolean :classes_complex
      t.boolean :classes_logical
      t.boolean :classes_appealing
      t.boolean :classes_unappealing

      t.boolean :cooperative_frustrating
      t.boolean :cooperative_fun
      t.boolean :cooperative_simple
      t.boolean :cooperative_complex
      t.boolean :cooperative_logical
      t.boolean :cooperative_appealing
      t.boolean :cooperative_unappealing
      
      t.text :other_feedback
    end
  end
end
