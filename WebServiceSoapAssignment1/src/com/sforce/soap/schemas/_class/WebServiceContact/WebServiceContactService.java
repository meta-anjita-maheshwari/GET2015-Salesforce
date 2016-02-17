/**
 * WebServiceContactService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.sforce.soap.schemas._class.WebServiceContact;

public interface WebServiceContactService extends javax.xml.rpc.Service {
    public java.lang.String getWebServiceContactAddress();

    public com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactPortType getWebServiceContact() throws javax.xml.rpc.ServiceException;

    public com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactPortType getWebServiceContact(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
