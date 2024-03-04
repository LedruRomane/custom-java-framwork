package annotations.params;

public enum METHOD_REST {
    GET("Get", 1),
    PUT("Put", 2),
    POST("Post", 3),
    DELETE("Delete", 3),

    UPDATE("Update", 4);

    private int value = -1;
    private String name;

    METHOD_REST(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "COMPONENT_TYPE{" +
                "name='" + name + '\'' +
                '}';
    }
}
