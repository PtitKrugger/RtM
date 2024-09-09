module TachesHelper
    def afficheFleche(colonne)
        if colonne == @col
            fleche = session['ordre'] == 'ASC' ? " ▴" : " ▾"
        else
            fleche = ""
        end

        return fleche
    end
end
