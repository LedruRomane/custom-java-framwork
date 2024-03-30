package tiw.is.arrivee;

public record Vol(String companie, String id, int nbBagages) {
    public Bagage getBagage(int idBagage) {
        return new Bagage(companie, id, idBagage);
    }
}
