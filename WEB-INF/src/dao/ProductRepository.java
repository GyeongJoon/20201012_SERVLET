package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>(); // ArrayList를 Product로 캐스팅

	public ProductRepository() {
		Product phone = new Product("P1234", "1865 까르베네 쇼비뇽", 100000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("red wine");
		phone.setManufacturer("wine");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
        
        Product notebook = new Product("P1235", "말벡", 150000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("red wine");
		notebook.setManufacturer("wine");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");

		Product tablet = new Product("P1236", "피노누아", 90000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("red wine");
		tablet.setManufacturer("wine");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        
        Product tablet1 = new Product("P1236", "쇼비뇽 블랑", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("white wine");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        
        Product tablet2 = new Product("P1236", "샤르 도네", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("white wine");
		tablet.setManufacturer("wine");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        
        Product tablet3 = new Product("P1236", "리슬링", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("white wine");
		tablet.setManufacturer("wine");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        
        Product tablet4 = new Product("P1236", "파스쿠아 스윗 로제", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("rose wine");
		tablet.setManufacturer("wine");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        
        Product tablet5 = new Product("P1236", "로제 봉봉", 80000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("rose wine");
		tablet.setManufacturer("wine");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        
        Product tablet6 = new Product("P1236", "간치아 모스카토 로제", 90000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("rose wine");
		tablet.setManufacturer("wine");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
        
		
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
}