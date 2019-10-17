package com.project.splace.admin.model.vo;

public class Sales {
   private int totalPrice; 
   private String month;

   public Sales() {
   }
   
   
   public Sales(int totalPrice, String month) {
      super();
      this.totalPrice = totalPrice;
      this.month = month;
   }

   public int getTotalPrice() {
      return totalPrice;
   }

   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }

   public String getMonth() {
      return month;
   }

   public void setMonth(String month) {
      this.month = month;
   }


   @Override
   public String toString() {
      return "Sales [totalPrice=" + totalPrice + ", month=" + month + "]";
   }
}