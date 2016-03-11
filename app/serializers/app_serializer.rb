class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :ok

  def ok
    object.ok?
  end
end
