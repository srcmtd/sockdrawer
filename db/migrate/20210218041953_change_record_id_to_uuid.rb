class ChangeRecordIdToUuid < ActiveRecord::Migration[6.0]
  def change
    # active_storage_attachments

    remove_column :active_storage_attachments, :record_id
    remove_column :active_storage_attachments, :record_type
    add_reference :active_storage_attachments, :record, null: false, polymorphic: true, index: false, type: :uuid

    # action_text_rich_texts

    remove_column :action_text_rich_texts, :record_id
    remove_column :action_text_rich_texts, :record_type
    add_reference :action_text_rich_texts, :record, null: false, polymorphic: true, index: false, type: :uuid
  end
end
