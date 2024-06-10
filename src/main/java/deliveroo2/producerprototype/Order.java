package deliveroo2.producerprototype;

import lombok.Data;

import java.util.Date;

@Data
public class Order {

        private int orderId;
        private Date date;

        public Order(int orderId, Date date) {
            this.orderId = orderId;
            this.date = date;
        }
}
