
@istest
public class Calculator_Test {
 
    //Create  test data - mock Database
    //Run the actual code with test Data
     //Use System.Assert methods to check data 

    @istest
    public static void addingTest(){
       Integer result = Calculator.adding(2,2);
       system.assertEquals(4, result,'These numbers are not equol.');

    }
}