package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
    
    public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
    
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
    private static ProductRepository instance = new ProductRepository();

   public static ProductRepository getInstance(){
	return instance;
   }
// ArrayList를 Product로 캐스팅

	public ProductRepository() {
		Product phone = new Product("P1234", "1865 까르베네 쇼비뇽", 100000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("red wine");
		phone.setManufacturer("wine");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
        phone.setFilename("P1234.jpg");

        
        Product notebook = new Product("P1235", "말벡", 150000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("red wine");
		notebook.setManufacturer("wine");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
        notebook.setFilename("P1235.jpg");

		Product tablet = new Product("P1236", "피노누아", 90000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("red wine");
		tablet.setManufacturer("wine");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        tablet.setFilename("P1236.jpg");
        
        Product tablet1 = new Product("P1237", "쇼비뇽 블랑", 900000);
		tablet1.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet1.setCategory("white wine");
		tablet1.setManufacturer("Samsung");
		tablet1.setUnitsInStock(1000);
		tablet1.setCondition("Old");
        tablet1.setFilename("P1237.jpg");
        
        Product tablet2 = new Product("P1238", "샤르 도네", 900000);
		tablet2.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet2.setCategory("white wine");
		tablet2.setManufacturer("wine");
		tablet2.setUnitsInStock(1000);
		tablet2.setCondition("Old");
        tablet2.setFilename("P1238.jpg");
        
        Product tablet3 = new Product("P1239", "리슬링", 900000);
		tablet3.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet3.setCategory("white wine");
		tablet3.setManufacturer("wine");
		tablet3.setUnitsInStock(1000);
		tablet3.setCondition("Old");
        tablet3.setFilename("P1239.jpg");
        
        Product tablet4 = new Product("P1240", "파스쿠아 스윗 로제", 900000);
		tablet4.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet4.setCategory("rose wine");
		tablet4.setManufacturer("wine");
		tablet4.setUnitsInStock(1000);
		tablet4.setCondition("Old");
        tablet4.setFilename("P1240.jpg");
        
        Product tablet5 = new Product("P1241", "로제 봉봉", 80000);
		tablet5.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet5.setCategory("rose wine");
		tablet5.setManufacturer("wine");
		tablet5.setUnitsInStock(1000);
		tablet5.setCondition("Old");
        tablet5.setFilename("P1241.jpg");
        
        Product tablet6 = new Product("P1242", "간치아 모스카토 로제", 90000);
		tablet6.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet6.setCategory("rose wine");
		tablet6.setManufacturer("wine");
		tablet6.setUnitsInStock(1000);
		tablet6.setCondition("Old");
        tablet6.setFilename("P1242.jpg");
        
		
		// 위와 같이 상품 초기화 하고 아래에 상품을 추가

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
        listOfProducts.add(tablet1);
        listOfProducts.add(tablet2);
        listOfProducts.add(tablet3);
        listOfProducts.add(tablet4);
        listOfProducts.add(tablet5);
        listOfProducts.add(tablet6);
        
		// listOfProducts.add(상품명);
	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
    public void addProduct(Product product) {
	listOfProducts.add(product);
   }

}