class AddAnswerQn1ToLampiranElevenCloseContact < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contacts, :answer_qn_1, :string
  end
end
