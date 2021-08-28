package www.dream.com.business.model;

import lombok.Data;

@Data
public class TradeVO {
	private String tradeId;
	private String productId;
	private int productFinalPrice;
	private String sellerId;
	private String buyerId;
	private String tradeDate;
	private int adminPermission;
}
