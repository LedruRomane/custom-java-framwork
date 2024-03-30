package tiw.is.arrivee;

public record Vol(String id, String company, String pointLivraisonBagages) {
    public Bagage getBagage(int idBagage) {
        return new Bagage(company, id, idBagage);
    }
}
