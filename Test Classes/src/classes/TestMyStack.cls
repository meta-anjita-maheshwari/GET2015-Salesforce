/*
* Name : TestMyStack
* Author : Anjita
* Created Date : 06/02/2016
* Usage : provide test coverage to class MyStack
*/
@isTest
public class TestMyStack {
    
    /*
     * test method for method 'push()' 
     */
    @isTest static void testPush(){
        MyStack mystack = new MyStack();
        mystack.push(new Account(Name='abc'));
        Account TestAcc = (Account)mystack.top();
        system.assertEquals('abc',TestAcc.Name);
    }
    
    /*
     * test method for method 'pop()' 
     */
    @isTest static void testPop(){
        MyStack mystack = new MyStack();
        mystack.push(new Account(Name='abc'));
        mystack.push(new Account(Name='xyz'));
        Account TestAcc = (Account)mystack.pop();
        system.assertEquals('xyz',TestAcc.Name);
    }
    
    /*
     * test method for method 'pop()' : underflow condition
     */
    @isTest static void testPopUnderflow(){
        MyStack mystack = new MyStack();
        Account TestAcc = (Account)mystack.pop();
        system.assertEquals(null,TestAcc.Name);
    }
    
    /*
     * test method for method 'top()' : underflow condition
     */
    @isTest static void testTopUnderflow(){
        MyStack mystack = new MyStack();
        Account TestAcc = (Account)mystack.top();
        system.assertEquals(null,TestAcc.Name);
    }
}