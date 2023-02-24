@isTest
private class CalculatorTest {
  static testMethod void testCalculator() {
    Calculator calculator = new Calculator();
    calculator.num1 = 10;
    calculator.num2 = 5;
    
    calculator.add();
    System.assertEquals(15, calculator.result);
    
    calculator.sub();
    System.assertEquals(5, calculator.result);
    
    calculator.multi();
    System.assertEquals(50, calculator.result);
    
    calculator.div();
    System.assertEquals(2, calculator.result);
  }
}