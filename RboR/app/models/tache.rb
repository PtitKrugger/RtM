class Tache < ApplicationRecord
    belongs_to :importance
    belongs_to :etat
end
