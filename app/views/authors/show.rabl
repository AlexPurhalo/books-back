collection @author
attribute :id, :name, :biography
child :books do |book|
    attribute :id, :title
end