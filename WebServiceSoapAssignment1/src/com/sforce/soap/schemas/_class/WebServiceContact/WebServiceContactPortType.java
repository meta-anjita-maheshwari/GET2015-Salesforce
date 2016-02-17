/**
 * WebServiceContactPortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.sforce.soap.schemas._class.WebServiceContact;

public interface WebServiceContactPortType extends java.rmi.Remote {
    public java.lang.String createNewStudent(java.lang.String name, java.lang.String classId, java.lang.String sex, java.util.Date dob) throws java.rmi.RemoteException;
    public java.lang.String queryForContact(java.lang.String query) throws java.rmi.RemoteException;
}
